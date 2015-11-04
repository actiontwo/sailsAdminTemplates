((window, angular)->
  window.app.controller "UserDeviceCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
     '$filter',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state, $filter)->
        $scope.user = $scope.$parent.user
        $http.get("/hdviet/device/find/#{$scope.user.user_id}")
        .success (result)->
          $scope.devices = result.data
          console.log result
        .error (result) ->
          console.log result

        $scope.save = ()->
          console.log $scope.user
    ])(window, window.angular)

