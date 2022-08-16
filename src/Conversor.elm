module Conversor exposing (Model, main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { cinput : String
    , finput : String
    }


init : Model
init =
    Model "" ""



-- UPDATE


type Msg
    = Celcius String
    | Faren String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Celcius celcius ->
            { model | finput = convertCelciusToFaren celcius }

        Faren faren ->
            { model | cinput = convertFarenToCelcius faren }


convertCelciusToFaren : String -> String
convertCelciusToFaren charlie =
    case String.toFloat charlie of
        Just cel ->
            String.fromFloat (cel * 1.8 + 32)

        Nothing ->
            "???"


convertFarenToCelcius : String -> String
convertFarenToCelcius faren =
    case String.toFloat faren of
        Just f ->
            String.fromFloat ((f - 32) / 1.8)

        Nothing ->
            "???"



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "celcius", onInput Celcius ] []
        , div [ style "color" "red" ] [ text model.finput ]
        , input [ type_ "text", placeholder "faren", onInput Faren ] []
        , div [ style "color" "red" ] [ text model.cinput ]
        ]
