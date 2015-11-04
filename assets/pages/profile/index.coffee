((window, angular)->
  window.app.controller "ProfileCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.loading = false
        $scope.dataUpdate = {}
        #
        $scope.$watch 'dataUpdate.password', (data)->
          return if _.isEmpty data
          return if data.length < 10

          $scope.user.password = data
        #
        $scope.$watch 'dataUpdate.phone', (data)->
          return if _.isEmpty data
          $scope.user.phone = data
        #
        $scope.$watch 'dataUpdate.displayName', (data)->
          return if _.isEmpty data
          $scope.user.displayName = data

        $http.get('/admin/profile/find').success (result)->
          console.log result
          $scope.user = result
        .error (result)->
          console.log result

        $scope.save = ()->
          return if _.isEmpty $scope.dataUpdate
          $scope.loading = true
          $http.post('/admin/profile/update', $scope.dataUpdate).success (result)->
            $scope.loading = false
          .error (result)->
            $scope.loading = false
            console.log result
    ])(window, window.angular)

