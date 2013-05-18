require
  paths: 
    'jquery'     : 'vendor/jquery-2.0.0'
    'three'      : 'vendor/three'
    'trackball'  : 'vendor/trackball'
    'date'       : 'vendor/date'
    'underscore' : 'vendor/underscore'
    'angular'    : 'vendor/angular'
    'leap'       : 'vendor/leap'
    'sol'        : 'scene/sol'
  shim:
    'angular'                            : deps: ['jquery']
    'app'                                : deps: ['angular','sol','ui/navigation']

    # Major parts of the Scene
    'sol' :
      deps: [
        'three'
        'leap'
        'utilities'
        'underscore'
      ]
      exports: 'Sol'

    # Parts of the app
    'bootstrap'                          : deps: ['app']
    'routes'                             : deps: ['app']
    'run'                                : deps: ['app']
    'views'                              : deps: ['app']

    # Controllers for various routes
    'controllers/closest'                : deps: ['services/orbit']

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
