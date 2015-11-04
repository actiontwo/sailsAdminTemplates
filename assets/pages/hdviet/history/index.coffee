((window, angular)->
  window.app.controller "HistoryCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
     '$filter',

      ($scope, $rootScope, $http, CsTool, $stateParams, $state, $filter)->
        $scope.limit = 20
        $scope.currentPage = 1
        $scope.histories = []

        $scope.endDate = new Date()
        date = new Date()
        $scope.startDate = date.setDate(date.getDate() - 30)

        $scope.pageChanged = () ->
          getHistory()

        getHistory = ()->
          startDate = $filter('date')($scope.startDate, 'yyyy-MM-dd')
          endDate = $filter('date')($scope.endDate, 'yyyy-MM-dd')
          $http.get("/admin/history/find?limit=#{$scope.limit}&page=#{$scope.currentPage}&startDate=#{startDate}&endDate=#{endDate}"
          )
          .success (result) ->
            console.log result
            $scope.totalItems = result.totalRecord;
            $scope.histories = result
          .error (result)->
            console.log result

        getHistory()
    ])(window, window.angular)

