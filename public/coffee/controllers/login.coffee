angular.module('app').controller 'login', ['$scope', 'authService', ($scope, authService) ->
  $scope.onRouteChange = () ->
    console.log 'changed route to login'
    authService.get()
    authService.post()

]