((window, angular)->
  window.app.controller "UserFindCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.loading = false
        CsTool.session.remove CsTool.config.key.user
        $scope.params =
          email : if  $stateParams.email then $stateParams.email else null

        getUserInfo = (email)->
          $scope.loading = true
          url = "/hdviet/user/find/?email=#{email}"
          $http.get(url)
          .success (result, status)->
            $scope.loading = false
            if status is 404
              CsTool.session.remove CsTool.config.key.user
              return
            $scope.user = result
            CsTool.session.set CsTool.config.key.user, result
          .error (result) ->
            $scope.loading = false
            console.log result

        if $scope.params.email?
          getUserInfo($scope.params.email)
    ])(window, window.angular)

