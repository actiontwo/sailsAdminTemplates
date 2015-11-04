((window, angular)->
  window.app.controller "CodeCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.menus = [
          href : 'code.create'
          title : 'Tạo mã vip'
        ,
          href : 'code.statistic'
          title : 'Thống kê vip'
        ]

    ])(window, window.angular)

