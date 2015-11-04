((window, angular)->
  window.app.controller "UserBlockCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
     '$filter',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state, $filter)->
        $scope.user = $scope.$parent.user
        console.log $scope.user
        $scope.loading = false
        $scope.blockAction = $scope.user.blocked
        $scope.blocks = [
          title : 'Khoá 1 ngày'
          value : 1
        ,
          title : 'Khoá 7 ngày'
          value : 7
        ,
          title : 'Khoá 30 ngày'
          value : 30
        ,
          title : 'Khoá vĩnh viễn'
          value : -1
        ,
          title : 'Không khoá'
          value : 0
        ]
        $scope.update = (value) ->
          $scope.blockAction = value

        $scope.save = ()->
          data =
            days : parseInt $scope.blockAction
            fromEmail : $scope.user.email
          $scope.loading = true
          $http.post("hdviet/user/blockUser/#{$scope.user.user_id}", data).success (result)->
            console.log result
            $scope.loading = false
            CsTool.session.set CsTool.config.key.user, result
            $scope.$parent.user = result
            CsTool.setNotification('Cập nhật thành công!', 'success')
            CsTool.updateHistory(
              userId : $scope.user.user_id
              actionId : CsTool.getActionId('khoa-nguoi-dung')
              message : ''
              data : data
            )
          .error (result)->
            console.log result
            $scope.loading = false
            CsTool.setNotification(result.message)
    ])(window, window.angular)

