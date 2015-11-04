((window, angular)->
  window.app.controller "DashboardCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'Help',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, Help, $stateParams, $state)->
        $scope.menus = [
          href : 'code.create'
          title : 'Tạo mã vip'
        ,
          href : 'code.statistic'
          title : 'Thống kê vip'
        ]

    ])(window, window.angular)

