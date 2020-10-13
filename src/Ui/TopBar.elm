module Ui.TopBar exposing (title, topBar)

{-| -}

import Element exposing (..)
import Element.Background
import Element.Font as Font
import Ui.Color exposing (Theme(..))
import Ui.Config exposing (config)


{-| -}
topBar :
    List (Attribute msg)
    -> Element msg
    -> Element msg
topBar attributes body =
    el
        (List.append attributes
            [ width fill
            , height <| px config.topBar.height
            , Element.Background.color Ui.Color.background
            , Font.color <| Ui.Color.text Dark
            ]
        )
        body


{-|

    topBarTitle =
        TopBar.title [] <| text "Top Bar Title"

-}
title : List (Attribute msg) -> Element msg -> Element msg
title attributes element =
    el
        ([ Font.color <| Ui.Color.text Dark
         , Font.size <| config.topBar.fontSize
         , paddingXY config.topBar.paddingX 0
         , centerY
         ]
            ++ attributes
        )
        element
