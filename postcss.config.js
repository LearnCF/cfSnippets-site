// postcss.config.js
const cssnano = require('cssnano');
const purgecss = require('@fullhuman/postcss-purgecss')({

  // Specify the paths to all ColdBox view and layout files in your project 
  content: [
    './layouts/**/*.cfm',
    './views/**/*.cfm'
    // If you have any installed modules that generate tailwind-styled HTML,
    // you'll need to reference those as well.
    // example: 'modules_app/**/views/*.cfm'
    // example: 'modules/**/layouts/*.cfm'
  ],

  // Include any special characters you're using in this regular expression
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
});

module.exports = {
  plugins: [
    require('tailwindcss'),
    // autoprefix if in production, else leave alone
    process.env.NODE_ENV === 'production'
      ? require('autoprefixer')
      : null,
    // minify CSS if in production, else leave alone
    process.env.NODE_ENV === 'production'
      ? cssnano({ preset: 'default' })
      : null,
    purgecss
  ]
}