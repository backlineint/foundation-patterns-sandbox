var gulp = require('gulp');
var $    = require('gulp-load-plugins')();
var gutil = require('gulp-util');

var sassPaths = [
  'bower_components/foundation-sites/scss',
  'bower_components/motion-ui/src'
];

gulp.task('sass', function() {
  return gulp.src('scss/zurb_foundation.scss')
    .pipe($.sass({
      includePaths: sassPaths
    })
    .on('error', $.sass.logError))
    .pipe($.autoprefixer({
      browsers: ['last 2 versions', 'ie >= 9']
    }))
    .pipe(gulp.dest('css'));
});

gulp.task('copy', function() {
  gulp.src('bower_components/foundation-sites/dist/css/*.css')
    .pipe($.copy('css', {prefix: 3}));
  gulp.src('bower_components/foundation-sites/dist/js/*.js')
    .pipe($.copy('js', {prefix: 3}));
  gulp.src('bower_components/motion-ui/dist/*.css')
    .pipe($.copy('css', {prefix: 3}));
  gulp.src('bower_components/motion-ui/dist/*.js')
    .pipe($.copy('js', {prefix: 3}));
  var activity = "Stylesheets and scripts from /bower_components/foundation-sites/dist and";
  activity += " bower_components/motion-ui/dist copied to /css and /js.";
  gutil.log(activity);
});

gulp.task('default', ['sass', 'copy'], function() {
  gutil.log('watching for .scss file changes in /scss.');
  gulp.watch(['scss/**/*.scss'], ['sass']);
});
