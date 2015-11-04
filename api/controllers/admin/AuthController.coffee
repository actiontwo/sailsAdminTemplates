exports.index = (req, res)->
  res.view 'pages/login'

exports.logout = (req, res)->
  req.session.destroy (error) ->
    return res.redirect '/login'

exports.auth = (req, res)->
  user = req.body
  if user.email is undefined
    return req.negotiate MessageService.auth.email.badRequest()

  async.waterfall [
    (cb)->User.checkUserExit user.email, cb
  ,
    (userInfo, cb)->
      if userInfo.password isnt md5(user.password)
        return cb true, MessageService.auth.password.invalid()
      cb null, userInfo
  ], (error, result)->
    if error
      return res.view 'pages/login', result
    req.session.authenticated = true
    req.session.user = result
    res.redirect '/'

