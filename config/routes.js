module.exports.routes = {
  '/': {
    view: 'home'
  },
  '/login': 'admin/AuthController',
  '/logout': 'admin/AuthController.logout',
  '/auth': 'admin/AuthController.auth'
};
