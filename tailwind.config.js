module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      proxima: ['Proxima'],
      magno: ['Magnolia'],
    },
    extend: {
      colors: {
        main: '#3778c2',
        second: '#5fb523',
        darktext: '#434b54',
        back: '#F1F3F2',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
