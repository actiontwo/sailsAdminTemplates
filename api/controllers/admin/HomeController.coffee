# HomeController
#
# @description :: Server-side logic for managing users
# @help        :: See http://links.sailsjs.org/docs/controllers

module.exports =
  index : (req, res)->
    name = if req.session.user.displayName then req.session.user.displayName else req.session.user.email
    res.view 'home' , {name : name}
