module.exports = (req, res, next) ->

  if (req.session.authenticated)
    req.options.locals =
      isLogin : true
    return next()

  return res.forbidden('You are not permitted to perform this action.',{redirect : 'login'});

