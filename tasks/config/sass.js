module.exports = function (grunt) {

  grunt.config.set('sass', {
    dev: {
      options: {
        lineNumbers: true
      },
      files: [
        {
          expand: true,
          cwd: 'assets',
          src: ['**/*.scss'],
          dest: '.tmp/public/',
          ext: '.css'
        }
      ]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-sass');
};
