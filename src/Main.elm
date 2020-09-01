module Main exposing (main)

import Browser
import Component
import Element exposing (Element)
import Element.Background
import Html exposing (Html)
import Theme


type alias Model =
    { title : String
    }


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
    ( { title = "Project Name"
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


subscriptions : model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    Element.layout
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.Background.color Theme.palette.background
        ]
        (Component.topBar { title = model.title })
