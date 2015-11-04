# User.coffee
#
# @description :: TODO: You might write a short summary of how this model works and what it represents here.
# @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  autoPK : false
  attributes :
    id :
      type : "string"
      primaryKey : true
      defaultsTo : ->
        (uuid.v4()).replace(/-/gi, '')
      unique : true
      index : true
    isAdmin :
      type : 'boolean'
      defaultsTo : false
    name : "string"
    password :
      type : "string"
      required : true

    email :
      type : "email"
      unique : true
      index : true
      required : true

    groupUser : "array"

    status :
      type : "boolean"
      defaultsTo : true

    createdBy : "string"
    updatedBy : "string"

  initData : ()->
    data = [
      email : 'cuongnh2@hdviet.com'
      password : '123456789'
      isAdmin : true
    ]
    User.findOrCreate(data).exec (error, users)->
      if error
        return sails.log.error error
  beforeCreate : (values, cb) ->
    values.password = md5 values.password
    cb()

  beforeUpdate : (values, cb) ->
    if values.password?
      values.password = md5 values.password
    cb()

  checkUserExit : (email, cb)->
    User.findOneByEmail(email).exec (error, result)->
      if error
        return cb true, MessageService.common.system(error)
      if result is undefined
        return cb true, MessageService.auth.email.notFound()
      return cb null, result
