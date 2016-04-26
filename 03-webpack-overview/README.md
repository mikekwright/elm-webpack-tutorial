03 - Webpack Overview
========================================

Ok at this point we have a project that we have created.  This project was simple but it is pretty dependant 
on us doing everything inside of elm (using elm-make, etc).  This means if we want to use other items to handle
out application (such as less for our css) we would have to manually script that together.  Lucky for us there
is a tool called webpack that will basically allow us to process files with different names in different 
fashions and combine the results into our expected application.  

## Overview

In this section we will be going over the basics of webpack which includes how to set it up, how to 
add our processors (elm, less), and how to use the tool in our development process.  

We will also discuss some of the philosophies that are in webpack, namely:   

1. Everything is a module
2. Only load what you want, when you want it

## Steps

1. First we will need to start our docker container (or install webpack) to see the options

        docker run -it mikewright/elm-webpack:STEP-3
        #
        npm install -g webpack

        webpack

2. Now lets create a project that will use webpack by creating a few files

        // package.json
        {
          "name": "elm-webpack-overview",
          "description": "lunch-n-learn goodness",
          "version": "0.0.1",
          "devDependencies": {
            "elm": "0.16.0",
            "elm-hot-loader": "0.2.0",
            "elm-webpack-loader": "2.0.0",
            "webpack": "1.13.0",
            "webpack-dev-server": "1.14.1"
          }
        }

        // elm-package.json
        {
          "version": "0.0.1",
          "summary": "elm-webpack-overview",
          "license": "BSD-3-Clause",
          "repository": "https://some-url/some-user/some-repo.git",
          "source-directories": [
            "src"
          ],
          "dependencies": {
            "elm-lang/core": "3.0.0 <= v < 4.0.0",
            "evancz/elm-html": "4.0.0 <= v < 5.0.0"
          },
          "elm-version": "0.16.0 <= v < 0.17.0"
        }

3. Install the dependencies we want for our system.   

        npm install
        elm make

4. So we have our build dependencies in place, lets start with our `webpack.config.js`   

        // webpack.config.js 
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
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                loader: 'elm-hot!elm-webpack'
              }
            ]
          }
        }

5. Now we can create a few files that we need for our app to work.  

        // dist/index.html
        <!DOCTYPE html>
        <html lang="en-us">
          <head>
            <meta charSet="utf-8"/>
            <title>elm-webpack-overview</title>
          </head>
          <body>
            <div id="main"></div>
          </body>
          <script src="bundle.js"></script>
        </html>

        // src/index.js
        var ElmApp = require( './Main.elm'  );
        ElmApp.embed( ElmApp.Main, document.getElementById( 'main'  ));

        // src/Main.elm
        import Html exposing (Html, text)

        main : Html
        main =
          text "Hello Webpack"

6. At this point we can now use webpack to build our application for us

        webpack
        
        # Note, this next command will open the index.html in your browser
        open dist/index.html

7. Lets make our app a little bit nicer with some css and style

        // src/Main.elm
         



### Notes


## References

