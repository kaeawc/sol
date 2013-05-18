define ['scene/paths/orbit'], (Orbit) ->
  class Planet
    constructor: (details) ->
      @orbit = details.orbit
      @diameter = details.diameter
      @color = details.color

      # wireframe = 
      #   color: 0xA63A3A
      #   wireframe: true
      #   overdraw: true

      segments = 16
      rings = 16

      # otherMat = new THREE.MeshBasicMaterial wireframe

      @orbit = new Orbit @orbit, true
      @geometry = new THREE.SphereGeometry @diameter, segments, rings
      @texture = new THREE.MeshLambertMaterial({ color: @color})
      @mesh = new THREE.Mesh @geometry, @texture

    moveTo: (position) ->
      @mesh.position.set position[0], position[1], position[2]

    render: (time) ->
      next = @orbit.positionAt time
      @moveTo next

  Planet