angular.element(document).ready () ->
  async.parallel [
      (cb)->
#        angular.element.get('/admin/action/findAll').success (result)->
#          sessionStorage.setItem 'cs-tool-action', JSON.stringify result
        cb(null, true)
    , (cb)->
#        angular.element.get("/admin/groupUser/find?limit=-1&page=1").success (result)->
#          sessionStorage.setItem 'cs-tool-group-user', JSON.stringify result.data
        cb(null, true)
    , (cb)->
#        angular.element.get("/admin/permission/find?limit=-1&page=1").success (result)->
#          sessionStorage.setItem 'cs-tool-permissions', JSON.stringify result.data
        cb(null, true)
    ],
    (error, result)->
      console.info 'app is ready'
      angular.bootstrap(document, ["insight-tool"]);

window.app = angular.module 'insight-tool', [
  'xeditable',
  'ngSanitize',
  'ui.router',
  'base64',
  'ui.bootstrap',
]

window.app.config [
  "$stateProvider",
  "$locationProvider",
  "$urlRouterProvider",
  "$httpProvider",
  "HelpProvider"
  ($stateProvider, $locationProvider, $urlRouterProvider, $httpProvider, $HelpProvider) ->
    $urlRouterProvider.otherwise('/dashboard')
    $stateProvider
    .state "dashboard",
      url : "/dashboard"
      template : Templates['insight.dashboard.view']()
      controller : 'DashboardCtrl'
]
window.app.run ['$rootScope', '$window', 'editableOptions', 'Help', ($rootScope, $window, editableOptions, Help)->
  editableOptions.theme = 'bs3'
  $rootScope.formatDate = 'dd/MM/yyyy'
  $rootScope.formatDateTime = 'dd/MM/yyyy HH:mm:ss'
  $rootScope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
    $rootScope.notifications = []
    console.log 'appchange'
]