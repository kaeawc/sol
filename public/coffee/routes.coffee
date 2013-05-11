angular.module('app').config ['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when '/closest',
    controller: 'closest'
  .otherwise
    redirectTo: '/'
]