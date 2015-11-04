/**
 * Precompiles Underscore templates to a `.jst` file.
 *
 * ---------------------------------------------------------------
 *
 * (i.e. basically it takes HTML files and turns them into tiny little
 *  javascript functions that you pass data to and return HTML. This can
 *  speed up template rendering on the client, and reduce bandwidth usage.)
 *
 * For usage docs see:
 *    https://github.com/gruntjs/grunt-contrib-jst
 *
 */

module.exports = function (grunt) {

	var templateFilesToInject = [
		'.tmp/public/pages/**/*.html'
	];

	grunt.config.set('jst', {
		dev: {
			options: {
				prettify: true,
				namespace: 'Templates',
				processName: function (filePath) {
					console.log(filePath);
					return filePath.replace(/\.tmp\/public\/pages\//, '').replace(/(\.html$)/, '').replace(/\//g, '.');
				}
			},
			files: {
				'.tmp/public/js/templates.js': require('../pipeline').templateFilesToInject
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-jst');
};
