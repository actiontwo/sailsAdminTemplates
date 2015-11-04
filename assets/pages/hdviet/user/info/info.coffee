((window, angular)->
  window.app.controller "UserInfoCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
     '$filter',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state, $filter)->
        $scope.user = $scope.$parent.user

        backupUser = []
        angular.copy($scope.user, backupUser);

        $scope.loading = false
        $scope.save = ()->
          $scope.loading = true

          data = CsTool.getObjectDiff $scope.user, backupUser

          if _.isEmpty data.new
            $scope.loading = false
            return

          if data.new.birthday
            data.new.birthday = $filter('date')(data.new.birthday, "yyyy-MM-dd");

          $http.put("/hdviet/user/update/#{$scope.user.user_id}", data.new)
          .success (result)->
            $scope.loading = false
            CsTool.session.set CsTool.config.key.user, result
            $scope.$parent.user = result
            CsTool.setNotification('Cập nhật thành công!', 'success')

            CsTool.updateHistory(
              userId : $scope.user.user_id
              actionId : CsTool.getActionId('cap-nhat-thong-tin')
              message : ''
              data : data
            )
          .error (result)->
            $scope.loading = false
            CsTool.setNotification(result.message)

    ])(window, window.angular)

