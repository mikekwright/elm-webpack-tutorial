var path = require('path');

module.exports = {
    entry: "./src/index.js",
    output: {
        path: path.resolve(__dirname, 'dist/'),
        filename: 'bundle.js'
    },
    module: {
        loaders: [
            {
                test: /\.elm$/ ,
                exclude: [/elm-stuff/, /node_modules/],
                loader: 'elm-hot!elm-webpack'
            },
            {
                test: /\.less$/,
                exclude: [/elm-stuff/, /node_modules/],
                loader: 'style!css!less'
            }
        ]
    }
}
