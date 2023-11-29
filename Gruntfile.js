'use strict';
module.exports = function(grunt) {
  // Run 2 tasks concurrently for building minified and unminified sass
  grunt.initConfig({
    concurrent: {
      all: ['sass:expanded', 'sass:minified', 'copy:main'],
    },
    sass: {
      expanded: {
        options: {
          style: 'expanded',
        },
        files: {
          'dist/index.css': 'src/index.scss',
        },
      },
      minified: {
        options: {
          style: 'compressed',
        },
        files: {
          'dist/index.min.css': 'src/index.scss',
        },
      },
    },
    copy: {
      main: {
        files: [
          {
            expand: true,
            cwd: 'src/',
            src: ['**/_*.scss'],
            dest: 'dist/'
          }
        ]
      }
    },
    clean: {
      dist: ['dist']
    }
  });

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-concurrent');

  grunt.registerTask('build', ['clean', 'concurrent']);
};
