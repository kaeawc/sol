angular.module('app').controller 'closest', ['$scope', 'camera', 'Sol', ($scope, camera, Sol) ->
  $scope.onRouteChange = () ->
    camera.flyTo("Earth")
    Sol.onlyShow("Earth","Sun","Moon","Closest Asteriods")

]