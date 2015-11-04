module.exports =
  common :
    system : (error)->
      sails.log.error error
      return ErrorService.prepare
        message : 'Hệ thống đang có lỗi vui lòng liên hệ Admin!'
        status : 500
  auth :
    email :
      notFound : ()->
        ErrorService.prepare
          message : 'Tài khoản không tồn tại!'
          status : 404
      badRequest : ()->
        ErrorService.prepare
          message : 'Tài khoản không tồn tại!'
          status : 401

    password :
      invalid : ()->
        ErrorService.prepare
          message : 'Mật khẩu không đúng'
          status : 402