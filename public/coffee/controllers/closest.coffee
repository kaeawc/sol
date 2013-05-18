angular.module('app').controller 'closest', ['$scope', 'Ship', 'orbitPaths', ($scope, Ship, orbitPaths) ->
  $scope.onRouteChange = () ->
    Ship.flyTo("Earth")
    Sol.onlyShow("Earth","Sun","Moon","Closest Asteriods")

]