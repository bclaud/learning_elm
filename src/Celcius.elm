module Celcius exposing (main)

import Browser
import Html exposing (Attribute, Html, div, input, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { finput : String
    , cinput : String
    }


init : Model
init =
    Model "" ""



-- UPDATE


type Msg
    = Finput String
    | Cinput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Finput newInput ->
            { model | finput = newInput }

        Cinput newInput ->
            { model | cinput = newInput }



-- VIEW


view : String -> Html Msg
view model =
    case String.toFloat model of
        Just celcius ->
            viewConverter model "blue" { c = String.fromFloat celcius, f = "" }

        Nothing ->
            viewConverter model "red" { c = "???", f = "" }


viewConverter : Model -> String -> EquivalentTemp -> Html Msg
viewConverter userInput color equivalentTemp =
    span []
        [ input [ value userInput.finput, onInput Cinput, style "width" "40px" ] []
        , text "°C = "
        , span [ style "color" color ] [ text equivalentTemp.c ]
        , text "°F"
        , div [ style "width" "40px" ] []
        , input [ value userInput.cinput, onInput Finput, style "width" "40px" ] []
        , text "F = "
        , span [ style "color" color ] [ text equivalentTemp.f ]
        , text "C"
        ]


type alias EquivalentTemp =
    { c : String, f : String }
