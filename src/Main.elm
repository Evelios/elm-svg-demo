module Main exposing (main)

import Browser
import Html exposing (Html)


type alias Model =
    {}


type Msg
    = Nothing


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


subscriptions : model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view _ =
    Html.div [] []
