angular.module('app').service 'orbitService', ['$scope', '$http', ($scope, $http) ->

  @get = () =>
    $http.get('/orbit')
]