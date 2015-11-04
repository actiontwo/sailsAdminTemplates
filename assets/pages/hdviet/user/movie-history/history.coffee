((window, angular)->
  window.app.controller "UserMovieHistoryCtrl",
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
          getHistoryMovie()
        getHistoryMovie = ()->
          $http.get("hdviet/history/userMovie/#{$scope.user.user_id}?limit=#{$scope.limit}&page=#{$scope.currentPage}")
          .success (result)->
            console.log result
            $scope.totalItems = result.totalRecord
            $scope.histories = result
          .error (resutl)->
            console.log resutl

        getHistoryMovie()

    ])(window, window.angular)

