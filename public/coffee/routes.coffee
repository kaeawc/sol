angular.module('app').config ['$routeProvider', ($routeProvider) ->
  console.log 'loaded routes'
  $routeProvider
  .when '/closest',
    controller: 'closest'
  .when '/login',
    controller: 'login'
  .otherwise
    redirectTo: '/'
]