angular.module('app').controller 'closest', ['$scope', 'camera', 'orbitPaths', ($scope, camera, orbitPaths) ->
  $scope.onRouteChange = () ->
    camera.flyTo("Earth")
    Sol.onlyShow("Earth","Sun","Moon","Closest Asteriods")

]