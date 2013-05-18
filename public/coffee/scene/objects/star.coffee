define [], () ->
  class Star
    constructor: () ->
      segments = 16
      rings = 16
      @geometry = new THREE.SphereGeometry 3, segments, rings
      @texture = new THREE.MeshLambertMaterial({ color: 0xFFFFDD })
      @mesh = new THREE.Mesh @geometry, @texture

    render: (time) ->

  Star