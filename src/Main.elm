module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Events
import Html exposing (Html)
import List.Extra
import Ui.Color
import Ui.Icon
import Ui.Panel
import Ui.TopBar


type alias Model =
    { title : String
    , showSettings : Bool
    }


type Msg
    = ToggleSettings


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
      , showSettings = True
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleSettings ->
            ( { model | showSettings = not model.showSettings }
            , Cmd.none
            )


subscriptions : model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    let
        topBar =
            Ui.TopBar.topBar []
                [ Ui.TopBar.title [] (text "Project Name")
                , Ui.TopBar.icon
                    [ alignRight
                    , Element.Events.onClick ToggleSettings
                    ]
                    Ui.Icon.settings
                ]

        body =
            row
                [ height fill
                , width fill
                ]
                ([ pictureContent ]
                    |> List.Extra.appendIf model.showSettings settings
                )

        pictureContent =
            el [ width fill, height fill ] none

        settings =
            Ui.Panel.panel []
                [ Ui.Panel.header [] <| text "Settings"
                , Ui.Panel.break
                ]
    in
    layout
        [ width fill
        , height fill
        , Background.color Ui.Color.background
        ]
        (column
            [ width fill
            , height fill
            ]
            [ topBar
            , body
            ]
        )
