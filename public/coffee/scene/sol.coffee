define [
  'three'
  'data/planets'
  'data/asteriods'
  'data/satellites'
], () ->
  class Sol
    constructor: () ->
      loaded        = new Date()
      PIXELS_PER_AU = 50
      jed           = toJED(loaded)
      planets       = {}
      asteriods     = {}
      satellites    = {}

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
