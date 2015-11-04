module.exports.policies = {
  "*": ["sessionAuth"],
  'admin/AuthController': {
    "*": true
  }
};