require('./less/style.less');

var Elm = require( './Main.elm'  );
Elm.embed( Elm.Main, document.getElementById( 'main'  ));
