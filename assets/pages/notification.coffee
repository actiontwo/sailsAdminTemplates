((window, angular)->
  window.app.controller "NotificationCtrl",
    ['$scope',
     '$rootScope',
      ($scope, $rootScope)->
        $rootScope.notifications = []
        $scope.close = ($index)->
          $rootScope.notifications.splice($index, 1)

    ])(window, window.angular)

