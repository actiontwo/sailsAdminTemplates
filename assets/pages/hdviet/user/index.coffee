((window, angular)->
  window.app.controller "UserCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.menus = [
          href : 'user.info'
          title : 'Thông tin người dùng'
        ,
          href : 'user.vip'
          title : 'Quản lý vip'
        ,
          href : 'user.block'
          title : 'Khoá người dùng'
        ,
          href : 'user.device'
          title : 'Quản lý thiết bị'
        ,
          href : 'user.transaction-history'
          title : 'Lịch sử giao dịch'
        ,
          href : 'user.movie-history'
          title : 'Lịch sử xem phim'
        ]

        $scope.user = CsTool.session.get CsTool.config.key.user
        $scope.$watch 'user', (data)->
          console.info 'data', data
        unless $scope.user?
          $state.go 'find-user'

    ])(window, window.angular)

