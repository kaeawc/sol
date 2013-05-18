define [
  'three'
  'trackball'
], () ->
  class Controls
    constructor: (@scene,@renderer) ->
      loaded       = new Date()

      # set the width/height to be used by webgl
      @WIDTH       = window.innerWidth
      @HEIGHT      = window.innerHeight

      # set some camera attributes
      @DISTANCE    = 400
      @THETA       = Math.PI / 2
      @PHI         = Math.PI / 2
      @GAMMA       = 0
      @VIEW_ANGLE  = 45
      @ASPECT      = @WIDTH / @HEIGHT
      @NEAR        = 1
      @FAR         = 5000
      @mouseDown   = false
      @target      = new THREE.Vector3()
      @container   = $('#sol')
      @perspective = new THREE.PerspectiveCamera @VIEW_ANGLE, @ASPECT, @NEAR, @FAR
      @trackball = new THREE.TrackballControls @perspective

      @trackball.rotateSpeed = 1.0
      @trackball.zoomSpeed = 1.2
      @trackball.panSpeed = 0.8

      @trackball.noZoom = false
      @trackball.noPan = false

      @trackball.staticMoving = true
      @trackball.dynamicDampingFactor = 0.3

      @trackball.keys = [ 65, 83, 68 ]

      @scene.add(@perspective)

      @perspective.position.x = 400
      @perspective.position.y = 0
      @perspective.position.z = 0

      @perspective.rotation.x = @THETA  # x-z axis rotation
      @perspective.rotation.y = @PHI    # y-z axis rotation
      @perspective.rotation.z = 0       # x-y axis rotation

      # This perspective should result in the camera looking along the x axis
      @renderer.setSize @WIDTH, @HEIGHT
      @container.append @renderer.domElement

  Controls