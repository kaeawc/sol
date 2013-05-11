angular.module('app').controller 'closest', ['$scope', 'Sol', ($scope, Sol) ->
  $scope.onRouteChange = () ->
    Sol.leapStart()

]