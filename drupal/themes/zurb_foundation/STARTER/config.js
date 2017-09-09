module.exports = {
  // Override options object in gulpfile.js, try not to override gulpfile.js if
  // not not necessary.
  drush: {
    enabled: true,
    alias: {
      css_js: 'drush cc css-js',
      cr: 'drush cr'
    }
  },

  // Override sass compile options.
  /*
  scss: {
    outputStyle: 'expanded'
  }
  */

  // If your files are on a network share, you may want to turn on polling for
  // Gulp watch. Since polling is less efficient, we disable polling by default.
  /*
  gulpWatchOptions: {
    interval: 1000,
    mode: 'poll'
  }
  */

};
