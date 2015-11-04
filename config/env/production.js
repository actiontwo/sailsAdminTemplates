/**
 * Production environment settings
 *
 * This file can include shared settings for a production environment,
 * such as API keys or remote database passwords.  If you're using
 * a version control solution for your Sails app, this file will
 * be committed to your repository unless you add it to your .gitignore
 * file.  If your repository will be publicly viewable, don't add
 * any private information to this file!
 *
 */

module.exports = {
  connections: {
    mongodbServer: {
      adapter: 'sails-mongo',
      host: 'localhost',
      port: 27017,
      // user: 'username',
      // password: 'password',
      database: 'flix-insight-tool'
    },
  },
  session: {
    adapter: 'mongo',
    host: 'localhost',
    port: 27017,
    db: 'sails',
    collection: 'sessions'
  },
  port: 1337
  // log: {
  //   level: "silent"
  // }

};
