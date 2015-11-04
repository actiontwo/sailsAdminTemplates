((window, angular)->
  window.app.controller "HeaderCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'Help',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, Help, $stateParams, $state)->
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

    ])(window, window.angular)

