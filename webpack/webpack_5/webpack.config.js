const HtmlWebpackPlugin = require("html-webpack-plugin")

module.exports = {
  mode:  'production',
  entry: '/files/staticfiles/js/development/development.js',
  output: {
    filename:   'main.js',
    path:       '/files/staticfiles/js/production/',
    // publicPath: '/staticfiles/',
  },

  devServer: {
    devMiddleware: {
          // index: true,
          // mimeTypes: { phtml: 'text/html' },
          // publicPath: '/publicPathForDevServe',
          // serverSideRender: true,
          writeToDisk: true,
        },
    host: "0.0.0.0",
    port: 80,
    hot: true,
    static: {
      directory: "/files/",
    },
    // headers: {
    //         'Access-Control-Allow-Origin': '*'
    //     },
  },
  watchOptions: {
    poll: 100,
    ignored:['**/node_modules/', '**/.npm'],
  },
};
