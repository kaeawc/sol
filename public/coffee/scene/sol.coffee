define [
  'data/planets'
  'data/asteriods'
  'data/satellites'
  'scene/controls'
  'scene/objects/planet'
  'scene/objects/star'
], (planets,asteriods,satellites,Controls,Planet,Star) ->

  class Sol
    constructor: (@loaded) ->
      window.PIXELS_PER_AU = 50

      @FPS           = 1000 / 60
      @time          = toJED(@loaded)
      @planets       = planets
      @asteriods     = asteriods
      @satellites    = satellites
      @objects       = []

      $('#sol').on 'wheel', =>
        console.log 'wheeling'
      
    # Given a list of objects, show them and hide all others
    showOnly: () ->
      @showThese arguments
      exceptions = @exceptThese arguments
      @hideThese exceptions

    showThese: () ->
      _.each arguments, (arg) ->
        @planets[arg].show()    if arg in @planets
        @asteriods[arg].show()  if arg in @asteriods
        @satellites[arg].show() if arg in @satellites

    hideThese: () ->
      _.each arguments, (arg) ->
        @planets[arg].hide()    if arg in @planets
        @asteriods[arg].hide()  if arg in @asteriods
        @satellites[arg].show() if arg in @satellites

    # animation loop
    stop: () ->
      @running = false

    loadPlanets: () ->
      @background()

      _.each @planets, (planet) =>
        @objects.push(new Planet(planet))

    loadSun: () ->

      @objects.push(new Star())
      @scene.add @makeLight([ 10, 0, 0])
      @scene.add @makeLight([-10, 0, 0])
      @scene.add @makeLight([ 0, 10, 0])
      @scene.add @makeLight([ 0,-10, 0])
      @scene.add @makeLight([ 0, 0, 10])
      @scene.add @makeLight([ 0, 0,-10])

    makeLight: (position) ->
      pointLight = new THREE.PointLight 0xFFFFFF
      pointLight.position.x = position[0]
      pointLight.position.y = position[1]
      pointLight.position.z = position[2]
      pointLight

    loadSceneObjects: () ->

      _.each @objects, (object) =>
        @scene.add(object.mesh)
        # @scene.add(object.orbit.path)

    # animation loop
    start: () ->
      return console.log 'Already animating' if @running
      # console.log 'Started Sol animation'
      @scene = new THREE.Scene()
      @renderer = new THREE.WebGLRenderer { 'antialias' : true }
      @renderer.setClearColor 0x000000, 1
      @controls = new Controls(@scene,@renderer)
      @running  = true
      @loadPlanets()
      @loadSun()
      @loadSceneObjects()
      @render()

    background: () ->
      path = "/img/dark-s_"
      format = '.jpg'
      urls = [
        path + 'px' + format,
        path + 'nx' + format,
        path + 'py' + format,
        path + 'ny' + format,
        path + 'pz' + format,
        path + 'nz' + format
      ]

      reflectionCube = THREE.ImageUtils.loadTextureCube(urls)
      reflectionCube.format = THREE.RGBFormat

      shader = THREE.ShaderLib.cube
      shader.uniforms["tCube"].value = reflectionCube

      material = new THREE.ShaderMaterial
        fragmentShader: shader.fragmentShader,
        vertexShader: shader.vertexShader,
        uniforms: shader.uniforms,
        depthWrite: false,
        side: THREE.BackSide

      cube = new THREE.CubeGeometry 5000, 5000, 5000
      mesh = new THREE.Mesh cube, material
      @scene.add(mesh)

    # animation loop
    onStop: () ->
      return console.log 'Sol is already stopped' if @running
      # console.log 'Stopped Sol animation'
      @scene    = false
      @camera   = false
      @renderer = false
      delete @scene
      delete @camera
      delete @renderer

    # render the scene
    render: () ->
      if @running
        @controls.trackball.update()
        _.each @objects, (object) =>
          return if !object || !object.render
          object.render @time

        @renderer.render(@scene, @controls.perspective)
        @time = @time + 0.5
        window.setTimeout () =>
          @render()
        , @FPS
      else
        @onStop()

    addPlanet: (Planet) ->

    addSatellite: (Satellite) ->

  window.Sol = new Sol(new Date())