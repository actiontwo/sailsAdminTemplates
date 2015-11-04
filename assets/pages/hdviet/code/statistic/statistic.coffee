((window, angular)->
  window.app.controller "CodeStatisticCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.vips = []
    ])(window, window.angular)

