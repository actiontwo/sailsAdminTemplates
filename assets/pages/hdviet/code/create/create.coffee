((window, angular)->
  window.app.controller "CodeCreateCtrl",
    ['$scope',
     '$rootScope',
     '$http',
     'CsTool',
     '$stateParams',
     '$state',
      ($scope, $rootScope, $http, CsTool, $stateParams, $state)->
        $scope.codeTypeSelected = {}
        $scope.emailRecieve = ''
        $scope.vipNumbers = 0
        $scope.message = ''
        $scope.reasons = [
          name : 'Đền bù ngày vip'
          id : 1
        ,
          name : 'Tặng vip'
          id : 2
        ]
        $scope.reasonSelected = $scope.reasons[0]
        $http.get('/hdviet/code/types').success (result)->
          $scope.codeTypes = result.data
          $scope.codeTypeSelected = $scope.codeTypes[0]

        $scope.save = ()->
          params =
            codeNumbers : $scope.codeNumbers
            email : $scope.emailRecieve
            codeTypeId : $scope.codeTypeSelected.code_type_id
            message : $scope.message

          console.log params
          $http.post('hdviet/code/create', params).success (result)->
            $scope.codesList = result
          .error (result)->
            console.error result

    ])(window, window.angular)

