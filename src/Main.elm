module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import Ui.Color exposing (Theme(..))
import Ui.TopBar
import Ui.Typography


type alias Model =
    { title : String
    , showSettings : Bool
    }


type Msg
    = None


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
      , showSettings = False
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )


subscriptions : model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view _ =
    let
        topBar =
            Ui.TopBar.topBar [] <|
                Ui.TopBar.title [] (text "Project Name")

        body =
            el
                [ height fill
                , width fill
                ]
                none
    in
    layout
        [ width fill
        , height fill
        , Background.color Ui.Color.foreground
        ]
        (column
            [ width fill
            , height fill
            ]
            [ topBar
            , body
            ]
        )
