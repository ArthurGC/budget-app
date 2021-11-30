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
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
