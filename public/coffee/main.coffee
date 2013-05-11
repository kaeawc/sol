requirejs.config({
  baseUrl:  '/public/js',
  paths:  {
    'jquery'     : 'vendor/jquery-2.0.0'
    'three'      : 'vendor/three'
    'date'       : 'vendor/date'
    'underscore' : 'vendor/underscore'
    'leap'       : 'vendor/leap'
  },
  shim : {
    'app': { deps : ['jquery','three','underscore','leap'] }
  }
});

require(['app']);