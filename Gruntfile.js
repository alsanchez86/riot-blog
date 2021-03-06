module.exports = function(grunt) {
  'use strict'

  // Force use of Unix newlines
  grunt.util.linefeed = '\n';

  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-concat-css');
  grunt.loadNpmTasks('grunt-contrib-cssmin');

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.loadNpmTasks('grunt-riot');
  // grunt.loadNpmTasks('grunt-string-replace');

  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // less
    less: {
      development: {
        options: {
          plugins: [
            new(require('less-plugin-autoprefix'))({
              browsers: ["last 2 versions"]
            })
          ]
        },
        files: {
          "<%= pkg.dist %>css/main.css": "<%= pkg.css %>less/main.less"
        }
      }
    },

    // css min
    cssmin: {
      target: {
        files: [{
          expand: true,
          cwd: "<%= pkg.dist %>css",
          dest: "<%= pkg.dist %>css",
          src: ["*.css", "!*.min.css"],
          ext: ".min.css"
        }]
      }
    },

    // coffee script
    coffee: {
      compile: {
        options: {
          bare: true,
        },
        files: {
          '<%= pkg.tmp %>all_coffee.js': [
            '<%= pkg.js %>coffee/main.coffee',
          ]
        }
      },
    },

    // riot tags
    riot: {
      options: {
        concat: true
      },
      task: {
        src: [
          '<%= pkg.js %>tags/*.tag',
        ],
        dest: '<%= pkg.tmp %>tags.js',
      }
    },

    // concatenar los ficheros js
    concat: {
      options: {
        separator: ';',
      },
      // unimos los ficheros compilados
      dist: {
        src: [
          // lib
          '<%= pkg.bower_components %>jquery/jquery.min.js', // [v < 2]
          '<%= pkg.node_modules %>riot/riot.min.js',
          '<%= pkg.node_modules %>riot-route/dist/route.min.js',

          // xstrap components
          '<%= pkg.bower_components %>xstrap/offcanvas/js/ie10-viewport-bug-workaround.js',
          '<%= pkg.bower_components %>xstrap/offcanvas/js/offcanvas.js',
          '<%= pkg.bower_components %>xstrap/transitions/js/transition.js',
          '<%= pkg.bower_components %>forms/js/forms.js',

          // tags
          '<%= pkg.tmp %>tags.js',

          // all coffee files compiled
          '<%= pkg.tmp %>all_coffee.js',
        ],
        dest: '<%= pkg.dist %>js/main.js',
      }
    },

    // uglify de js
    uglify: {
      options: {
        mangle: true
      },
      my_target: {
        files: {
          '<%= pkg.dist %>js/main.min.js': ['<%= pkg.dist %>js/main.js']
        }
      }
    },

    // ficheros a observar que lanzarán la función default (varias)
    watch: {
      scripts: {
        tasks: ['default'],
        options: {
          interrupt: false,
        },
        files: [
          '<%= pkg.css %>less/*.less',
          '<%= pkg.js %>tags/*.tag',
          '<%= pkg.js %>coffee/*.coffee'
        ]
      }
    }
  });

  grunt.registerTask("dev", ["less", "riot", "coffee", "concat"]);
  grunt.registerTask("prod", ["dev", "cssmin", "uglify"]);
  grunt.registerTask("default", ["prod"]);
};
