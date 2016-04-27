import Html exposing (Html, div, header, text, input, button, label, span)
import Html.Attributes exposing (id, style)
import Html.Events exposing (onClick)
import Signal exposing (Signal, Address)

type alias NameModel = 
  { 
    name : String 
  }

---- MAIN

main : Signal Html
main =
  Signal.map (page modelSignal.address) modelSignal.signal

---- MODEL

initialModel : NameModel
initialModel = 
  { 
    name = "Me"
  }

updateModel : NameModel -> String -> NameModel
updateModel model newName =
  {
    name = newName
  }

modelSignal : Signal.Mailbox NameModel
modelSignal = 
  Signal.mailbox initialModel

---- VIEW

page : Address NameModel -> NameModel -> Html
page address model =
  div [ id "page" ]
  [
    banner "My UI",
    div [ id "header", myBodyStyle ] 
      (myBody address model)
  ]

myBody : Address NameModel -> NameModel -> List Html
myBody address model = 
  [
    div [] 
      [
        label [ inputStyle ] [ text "Name" ],
        input [] [] 
      ],
    div [] 
      [
        button 
          [ 
            updateModel model "Other"
              |> onClick address 
          ] 
          [ text "Here" ]
      ],
    div []
      [
        span [] [ text model.name ]  
      ]
  ]

inputStyle : Html.Attribute
inputStyle = 
  style
    [
      ("padding-right", "10px")
    ]

myBodyStyle : Html.Attribute
myBodyStyle = 
  style 
  [
    ("width", "1024px"),
    ("margin", "0 auto"),
    ("padding-top", "10px")
  ]

banner : String -> Html
banner msg =
    div [ id "body" ]
    [
        header [ id "header", style bannerStyle ]
        [
            div [ id "header message", style [ ("text-align", "center") ] ]
            [
                text msg 
            ]
        ]
    ]

bannerStyle : List (String, String)
bannerStyle =
    [
        ("backgroundColor", "aliceblue"),
        ("width", "1024px"),
        ("margin", "0 auto"), 
        ("padding", "10px"), 
        ("border-bottom", "solid 1px black")
    ]
