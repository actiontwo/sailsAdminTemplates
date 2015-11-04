module.exports =
  prepare : (data = {message : '', status : ''})->
    err = new Error();
    err.message = data.message
    err.status = data.status
    if data.status isnt 500
      sails.log.warn err
    return err


