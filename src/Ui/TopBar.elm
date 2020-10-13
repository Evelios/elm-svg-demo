module Ui.TopBar exposing (icon, title, topBar)

{-| -}

import Element exposing (..)
import Element.Background
import Element.Font as Font
import Ui.Color exposing (Theme(..))
import Ui.Config exposing (config)
import Ui.Icon as Icon exposing (Icon)


{-| -}
topBar :
    List (Attribute msg)
    -> List (Element msg)
    -> Element msg
topBar attributes body =
    row
        ([ width fill
         , height <| px config.topBar.height
         , Element.Background.color Ui.Color.background
         , Font.color <| Ui.Color.text Dark
         ]
            ++ attributes
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


{-|

    topBarSettings =
        TopBar.icon [] Ui.Icon.settings

-}
icon : List (Attribute msg) -> Icon msg -> Element msg
icon attributes theIcon =
    Icon.render
        ([ paddingXY config.topBar.paddingX 0
         , centerY
         ]
            ++ attributes
        )
        { color = Ui.Color.text Dark
        , size = config.topBar.fontSize
        }
        theIcon
