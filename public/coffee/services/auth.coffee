angular.module('app').service 'authService', ['$scope', '$http', ($scope, $http) ->

  @get = () =>
    console.log "getting login form"
    $http.get('/login')

  @post = () =>
    console.log "posting login form"
    $http.post('/login')
]