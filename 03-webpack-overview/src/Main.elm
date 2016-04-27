import Html exposing (Html, text, div, span)
import Html.Attributes exposing (id, class)

main : Html
main =
  div [ class "elm-body" ] 
  [
    div [ id "content-div", class "content" ]
    [ 
      text "Hello pretty webpack!!!"
    ]
  ]

