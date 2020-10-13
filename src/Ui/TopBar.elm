module Ui.TopBar exposing (topBar)

{-| -}

import Element exposing (..)
import Element.Background
import Ui.Color
import Ui.Config exposing (config)


topBar :
    List (Attribute msg)
    -> Element msg
    -> Element msg
topBar attributes body =
    el
        (List.append attributes
            [ width fill
            , height <| px <| round config.topBar.height
            , Element.Background.color Ui.Color.background
            ]
        )
        body
