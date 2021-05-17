module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      outline: {
        blue: '2px solid #3c5997',
      },
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        blue: {
          light: '#3b5998',
        }
      },
      container: {
        center: true,
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
