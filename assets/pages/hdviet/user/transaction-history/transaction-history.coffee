((window, angular)->
  window.app.controller "UserTransactionHistoryCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
     '$filter',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state, $filter)->
        $scope.user = $scope.$parent.user
        $scope.totalItems = 50
        $scope.currentPage = 1
        $scope.limit = 10
        $scope.pageChanged = ()->
          getHistoryTransaction()

        getHistoryTransaction = () ->
          $http.get("/hdviet/history/userTransaction/#{$scope.user.user_id}?limit=#{$scope.limit}&page=#{$scope.currentPage}")
          .success (result)->
            console.log result
            $scope.userTransaction = result.data
            $scope.totalItems = result.totalRecord
          .error (result) ->
            console.log result

        getHistoryTransaction()

    ])(window, window.angular)

