module Main exposing (main)

import Browser
import Browser.Dom
import Data.Size as Size exposing (Size)
import Element exposing (..)
import Element.Background as Background
import Element.Events
import Generative
import Html exposing (Html)
import List.Extra
import Picture
import Pixels exposing (Pixels)
import Quantity
import Task
import Ui.Color
import Ui.Icon
import Ui.Panel
import Ui.TopBar


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- Init


type alias Model =
    { title : String
    , showSettings : Bool
    , size : Size Pixels
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { title = "Project Name"
      , showSettings = True
      , size = Size.size Quantity.zero Quantity.zero
      }
    , Task.perform GotViewport Browser.Dom.getViewport
    )



-- Update


type Msg
    = ToggleSettings
    | GotViewport Browser.Dom.Viewport


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleSettings ->
            ( { model | showSettings = not model.showSettings }
            , Cmd.none
            )

        GotViewport { viewport } ->
            ( { model
                | size =
                    Size.size
                        (Pixels.float viewport.width)
                        (Pixels.float viewport.height)
              }
            , Cmd.none
            )


subscriptions : model -> Sub Msg
subscriptions _ =
    Sub.none



-- View


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
                ([ pictureContent model
                 ]
                    |> List.Extra.appendIf model.showSettings settings
                )

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


pictureContent : Model -> Element msg
pictureContent model =
    let
        pictureSize =
            model.size
                |> Size.subtractHeight (Pixels.float <| toFloat Ui.TopBar.topBarHeight)
                |> (\size ->
                        if model.showSettings then
                            Size.subtractWidth (Pixels.float <| toFloat Ui.Panel.panelWidth) size

                        else
                            size
                   )
    in
    el [ width fill, height fill ] <|
        Generative.render (Size.aspectRatio pictureSize) Picture.picture
