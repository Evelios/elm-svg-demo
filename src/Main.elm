module Main exposing (main)

import Browser
import Component exposing (settings)
import Element exposing (Element)
import Element.Background
import Html exposing (Html)
import Theme


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
      , showSettings = False
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


appendIf : Bool -> a -> List a -> List a
appendIf cond ele list =
    case cond of
        True ->
            List.append list [ ele ]

        False ->
            list


view : Model -> Html Msg
view model =
    let
        topBar =
            Component.topBar
                { title = model.title
                , toggleSettings = ToggleSettings
                }

        body =
            Element.row
                [ Element.height Element.fill
                , Element.width Element.fill
                ]
                ([ Component.imageView ]
                    |> appendIf model.showSettings (settings [])
                )
    in
    Element.layout
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.Background.color Theme.palette.background
        ]
        (Element.column
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            [ topBar
            , body
            ]
        )
