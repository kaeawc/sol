define [
  'three'
  'sol'
], () ->
  class Ship
    constructor: (@name, @fuel, @position, @velocity, @orbit) ->
      loaded        = new Date()
      fuel          = 0.0
      oxygen        = 0.0
      food          = 0.0
      velocity      =
        speed     : 0.0
        direction :
          theta : 0
          zeta  : 0

    # Given a destination, fly to it
    flyTo: (name) ->
      console.log 'Flying to ' + name

    # Change the camera to use third person (outside) view
    thirdPerson: () ->
      console.log 'Showing outside'

    # Change the camera to use first person (cockpit) view
    firstPerson: () ->
      console.log 'Showing cockpit'

    zoom: (level) ->
      console.log 'Zooming to ' + level