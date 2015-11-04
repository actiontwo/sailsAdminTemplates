((window, angular)->
  window.app.provider("Help", ()->

    config =
      key :
        user : 'cs-tool-current-user'

    Helpto =
      config : (configCustom)->
        console.log configCustom
        config = configCustom or config
      $get : ['$http', '$rootScope', '$q', '$window', '$document', ($http, $rootScope, $q, $window, $document)->


        removeSession = (key)->
          sessionStorage.removeItem key

        setSession = (key, data)->
          sessionStorage.setItem key, JSON.stringify data

        getSession = (key)->
          data = sessionStorage.getItem key
          unless data?
            return null
          return JSON.parse data

        setNotification = (message, type = 'warning')->
          $rootScope.notifications.push(
            type : type
            message : message
          )

        HelptoGet =
          config : config
          setNotification : setNotification
          session :
            set : setSession
            get : getSession
            remove : removeSession

        return HelptoGet
      ]

    return Helpto
  ))(window, window.angular)

