module Main exposing (main)

import Browser
import Component
import Element exposing (Element)
import Html exposing (Html)


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
        ]
        (topBar { title = model.title })



--(topBar
--    { title = model.name }
--)


topBar : { title : String } -> Element msg
topBar { title } =
    Element.row
        []
        [ Component.icon.settings
        , Element.text title
        ]
