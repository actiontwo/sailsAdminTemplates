((window, angular)->
  window.app.directive("menuAction", ['$rootScope', '$document', '$state', ($rootScope, $document, $state) ->
      return {
      restrict : "E"
      scope : {
        total : '='
      }
      template : Templates['modules.menu-action.main']()
      link : (scope, element, attr) ->
        scope.title = if attr.titleDisable then false else true
        console.log scope.title
        scope.data = []
        if attr.list
          scope.data.push(
            href : attr.list
            icon : 'fa fa-list'
            name : 'List'
          )
        if attr.create
          scope.data.push(
            href : attr.create
            icon : 'fa fa-user-plus'
            name : 'Create'
          )
        if attr.view
          scope.data.push(
            href : attr.view
            icon : 'fa fa-eye'
            name : 'View'
          )
        if attr.delete
          scope.data.push(
            href : attr.delete
            icon : 'fa fa-trash'
            name : 'Delete'
          )
      }

    ]
  ))(window, window.angular)