((window, angular)->
  window.app.controller "NotificationCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $rootScope.notifications = []
        $scope.close = ($index)->
          $rootScope.notifications.splice($index, 1)

    ])(window, window.angular)

