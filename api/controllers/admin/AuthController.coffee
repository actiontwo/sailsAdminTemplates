exports.index = (req, res)->
  res.view 'pages/login'

exports.logout = (req, res)->
  req.session.destroy (error) ->
    return res.redirect '/login'

exports.auth = (req, res)->
  res.view 'pages/login'


