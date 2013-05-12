require
  paths: 
    'jquery'     : 'vendor/jquery-2.0.0'
    'three'      : 'vendor/three'
    'date'       : 'vendor/date'
    'underscore' : 'vendor/underscore'
    'angular'    : 'vendor/angular'
    'leap'       : 'vendor/leap'
    'Sol'        : 'scene/sol'
  shim:
    'angular'                            : deps: ['jquery']
    'app'                                : deps: ['angular','underscore']

    # Major parts of the Scene
    'scene/sol'                          : deps: ['app','three']
    'scene/camera'                       : deps: ['app','scene/sol']
    'scene/ship'                         : deps: ['app','scene/sol']

    # Objects requiring three dimensional models
    'scene/objects/asteriod'             : deps: ['app','scene/sol']
    'scene/objects/planet'               : deps: ['app','scene/sol']
    'scene/objects/satellite'            : deps: ['app','scene/sol']
    'scene/objects/star'                 : deps: ['app','scene/sol']

    # Paths that don't really have any real substance
    'scene/paths/mission'                : deps: ['app','scene/sol']
    'scene/paths/orbit'                  : deps: ['app','scene/sol']

    # Parts of the app
    'bootstrap'                          : deps: ['app']
    'routes'                             : deps: ['app']
    'run'                                : deps: ['app']
    'views'                              : deps: ['app']

    # Controllers for various routes
    'controllers/closest'                : deps: ['app','scene/sol','services/orbit']
    'controllers/explore'                : deps: ['app','scene/sol']
    'controllers/leap'                   : deps: ['app','scene/sol','leap']
    'controllers/track'                  : deps: ['app','scene/sol']

    # Services that connect to RESTful endpoints
    'services/orbit'                     : deps: ['app']
    'services/geolocation'               : deps: ['app']
    'services/mission'                   : deps: ['app']
  [
    'require'
    'bootstrap'
    'angular'
  ], (require, bootstrap) ->
    angular.element(document).ready ->
      require ['bootstrap']
