02 - Elm UI
==========================================================

Now that we have created a simple hello world application using elm, lets move forward 
with something a little more exciting, like some UI.   

## Overview

In this part we will move forward with our discussion of elm to cover other packages
and a lot of the fundamentals that exist when working in elm.  This will not be
an indepth discussion of every aspect of the language, only in the pieces that we will
use when creating our UI application.   

This topics include:    

1. Function Basics (Including partial functions and the `|>` operator)   
2. Simple type signatures (and generics)
3. Import statements and modules

## Steps

1. Lets start up our container (or have installed required pieces) 

        docker run --rm -it -p 8000:8000 -v $PWD:/src mikewright/elm-webpack:STEP-2

2. Create our initial project by running the elm make 

        elm make

3. Add our dependencies that we want for this application.   

        elm package install evancz/elm-html

4. Create our `Main.elm` file    

        import Html

        main : Html.Html
        main = 
          Html.text "Again"

5. Lets test our app to make sure that it compiles correctly.  

        elm make Main.elm

6. Run our server

        elm reactor

7. Lets do a little refactoring for our application by taking the main method body and
converting it to another method that we can define (to take message).   

        banner : String -> Html.Html
        banner msg = 
          "Banner: " ++ msg ++ " :Banner"
            |> Html.text

        main = 
          banner "Again"

8. Now we have our content pulled out lets render it a little bit differently   

        import Html.Attributes

        banner : String -> Html.Html
        banner msg = 
          Html.div [ Html.Attributes.id "body" ]
          [
            Html.header [ Html.Attributes.id "header" ]
            [
              Html.div [ Html.Attributes.id "header message" ]
              [
                Html.text msg
              ]
            ]
          ]

9. Lets add some style to the page

        ...
        Html.div [ Html.Attributes.id "body", Html.Attributes.style bannerStyle ]
        ...

        bannerStyle : List (String, String)
        bannerStyle = 
          [
            ("backgroundColor", "aliceblue"),
            ("width", "1024px"),
            ("margin", "0 auto"),
            ("padding", "10px"),
            ("border-bottom", "solid 1px black")
          ]

        ...
        Html.div [ Html.Attributes.id "header message", Html.Attributes.style [ ("text-align", "center") ] ]
        ....

10. Looking at the code you willl see lots of `Html.` and `Html.Attributes.`, lets clean those up.   

        import Html exposing (Html, div, header, text)
        import Html.Attributes exposing (id, style)

11. Now that we have a page with some style, lets add a button to do something

        import Html.Events exposing (onClick)        
        import Signal exposing (Signal, Address)

        modelSignal : Signal.Mailbox String
        modelSignal = 
          Signal.Mailbox ""

        main : Signal Html
        main = 
          Signal.map (page modelSignal.address) modelSignal.signal

        page : Address String -> String -> Html
        page address model =
          div [ id "page" ]
            [
              banner "Test UI",
              div [ id "header", bodyStyle ]
                (pageBody address model)
            ]

        pageBody : Address String -> String -> List Html
        pageBody address model = 
          [
            div []
              [
                span [] [ text model ]
              ],
            div []
              [
                button 
                  [ onClick address "New Text" ] 
                  [ text "Test" ]
              ]
          ] 

        bodyStyle : Html.Attribute
        bodyStyle = 
          style
            [
              ("width", "1024px"),
              ("margin", "0 auto"),
              ("padding-top", "10px")
            ]

         
### Notes

This section will hold the notes on the different steps, specifically targeting
items that need further discussion or details.  

#### Step 5

This step does something different, basically it helps to not only generate the 
js file that contains our compiled elm code (`elm.js`) but also updates our 
application to have an `index.html` file that we can target and can actually 
load without using `elm reactor`.    

#### Step 7

In this step we are going over some of the basic concepts found in elm, the 
function generation and the pipe (`|>`) operator.  

The idea here is that functions can be built to take any number of arguments
and will automatically return the results of the last step in the method.   

As for the pipe operator, this allows us to take a statement that reads inside 
out and give it a more natural feel.  Basically it takes the results of the 
previous statement and passes it as an argument to the method called.   

        Html.text "Banner: " ++ msg ++ " :Banner"
        -- becomes
        "Banner: " ++ msg ++ " :Banner" 
          |> Html.text

#### Step 8

In this step we start to see more sophisticated generation of html using the
elm Html module.  Most of the html elements that we will use are broken up into
a few pieces.  The actually definition of `div` for example is located below.  

        div : List Html.Attributes -> List Html.Html -> Html.Html

The first argument that goes into the div is the list of attributes you would 
reference on the html element (such as `id`, `class`, etc).    

The next list is the list of html elements that would go inside of the `div` which
will result in a final Html element.   

#### Step 9

In step nine, we add our first style attributes to our html elements that we created
the style Attribute is basically defined as 
`style : List (String, String) -> Html.Attribute`, this means that we can pass it a
list of tuples that are the key/value pair for css.    

#### Step 10

When you have multiple imports, you don't always want to use the fully qualified
name when referencing things, so elm provides a syntax called `exposing` that 
takes whatever is exposed from a module and makes it directly reference-able.   

        Html.Attributes.id "myId"
        -- becomes
        import Html.Attributes exposing (id)
        id "myId"

If there are a number of things that you would need to import and you would 
rather not have to import specific ones you can expose all values using `...`

        import Html.Attributes exposing (...)

#### Step 11

In this step we are tapping into the core piece that elm uses for interactions
with the user in the system.  With elm this system is broken down into a 
couple of components.  

1. Signals / Mailboxes
2. Addresses
3. Events

## References

[Real World Elm - Form Validation](http://engineering.truqu.com/2015/09/25/real-world-elm-part-2.html)    
[Elm Architecture Tutorial](https://github.com/evancz/elm-architecture-tutorial)     
[Todo - Elm Style](https://github.com/evancz/elm-todomvc)     



