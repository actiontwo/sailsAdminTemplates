((window, angular)->
  window.app.controller "UserVipCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.loading = false
        $scope.user = $scope.$parent.user
        $scope.action = 'them-ngay-vip'
        $scope.reason = 'den-bu-ngay-vip'
        $scope.message = ''
        $scope.vipDay = 0
        $scope.accountTransfer = ''

        $scope.reasons = [
          name : 'Đền bù ngày vip'
          slug : 'den-bu-ngay-vip'
        ,
          name : 'Khuyến mãi ngày vip'
          slug : 'khuyen-mai-ngay-vip'
        ,
          name : 'Loại khác'
          slug : 'loại-khac'
        ]

        $scope.save = ()->

          data =
            vipDay : parseInt $scope.vipDay
            actionId :CsTool.getActionId( $scope.action)
            message : $scope.message
          url = ''

          dataUpdateToHistory =
            userId : $scope.user.user_id
            actionId : CsTool.getActionId $scope.action
            message : $scope.message
            data :
              vipDay : $scope.vipDay
              fromEmail : $scope.user.email
              toEmail : ''

          switch $scope.action
            when 'them-ngay-vip'
              url = "/hdviet/vip/create/#{$scope.user.user_id}"

            when 'xoa-ngay-vip'
              url = "/hdviet/vip/remove/#{$scope.user.user_id}"

            when 'chuyen-ngay-vip'
              url = "/hdviet/vip/transfer/#{$scope.user.user_id}"
              data.toUser = $scope.accountTransfer
              dataUpdateToHistory.data.toEmail = $scope.accountTransfer

          $scope.loading = true
          $http.post(url, data)
          .success (result, status)->
            $scope.loading = false
            CsTool.session.set CsTool.config.key.user, result.data
            $scope.$parent.user = result.data
            CsTool.setNotification('Cập nhật thành công!', 'success')
            CsTool.updateHistory dataUpdateToHistory

          .error (result)->
            console.error result
            $scope.loading = false
            CsTool.setNotification(result.message)

#        $scope.action = $scope.actions[0]._id

    ])(window, window.angular)

