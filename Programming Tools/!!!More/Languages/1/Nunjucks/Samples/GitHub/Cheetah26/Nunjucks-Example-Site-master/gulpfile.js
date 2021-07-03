var gulp = require('gulp');

var nunjucksRender = require('gulp-nunjucks-render');
gulp.task('build_html', function() {
  return gulp.src('./src/pages/**/*.njk')
    .pipe(nunjucksRender({
        path: "./src/components"
    }))
    .pipe(gulp.dest('./dist'))
});

gulp.task('build_css', function() {
  return gulp.src('./src/styles/**/*.css')
    .pipe(gulp.dest('./dist/styles'))
})

var browserSync = require('browser-sync').create();
gulp.task('serve', function() {
  browserSync.init({
    server: {
      baseDir: 'dist',
    },
  });
  browserSync.watch('./src/**/*.*', {}, gulp.series('build_html', 'build_css', browserSync.reload));
})

gulp.task('build', gulp.series('build_html', 'build_css'));

gulp.task('default', gulp.series('serve'));