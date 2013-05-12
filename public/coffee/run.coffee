angular.module('app').run ['$rootScope', '$log', ($rootScope, $log) ->
  console.log 'loaded run'
  # fire an event related to the current route
  $rootScope.$on '$routeChangeSuccess', (event, currentRoute, priorRoute) ->
    $rootScope.$broadcast "#{currentRoute.controller}$routeChangeSuccess", currentRoute, priorRoute
]