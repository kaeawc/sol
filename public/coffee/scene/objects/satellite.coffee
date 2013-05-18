define [], () ->
  class Satellite
    constructor: (@telemetry, @diameter, @material) ->
      @orbit = new Orbit(@telemetry)
      @geometry = new THREE.SphereGeometry(@diameter)
      @texture = new THREE.MeshBasicMaterial(@material)
      @mesh = new THREE.Mesh(@geometry, @texture)

    moveTo: (position) ->
      @mesh.position.set position[0], position[1], position[2]

    render: (time) ->
      next = @orbit.positionAt time
      @moveTo next

  Satellite