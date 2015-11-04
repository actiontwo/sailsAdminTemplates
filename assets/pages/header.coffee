((window, angular)->
  window.app.controller "HeaderCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.menus = [
          href : 'find-user'
          title : 'Thao tác người dùng'
        ,
          href : 'code.create'
          title : 'Tạo mã code'
#        ,
#          href : 'notification'
#          title : 'Notification'
        ,
          href : 'history'
          title : 'Lịch sử thao tác'
        ,
          href : 'admin'
          title : 'Admin'
        ]

#        $scope.user = CsTool.session.get CsTool.config.key.user
#        unless $scope.user?
#          $state.go 'find-user'

    ])(window, window.angular)

