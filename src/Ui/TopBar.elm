module Ui.TopBar exposing (icon, title, topBar)

{-| -}

import Element exposing (..)
import Element.Background
import Element.Font as Font
import Ui.Color
import Ui.Config
import Ui.Icon as Icon exposing (Icon)


{-| -}
topBar :
    List (Attribute msg)
    -> List (Element msg)
    -> Element msg
topBar attributes body =
    row
        ([ width fill
         , height <| px Ui.Config.topBar.height
         , Element.Background.color Ui.Color.uiBackground
         , Font.color <| Ui.Color.textLight
         , Font.semiBold
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
        ([ Font.color <| Ui.Color.textLight
         , Font.size <| Ui.Config.topBar.fontSize
         , paddingXY Ui.Config.topBar.paddingX 0
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
        ([ paddingXY Ui.Config.topBar.paddingX 0
         , centerY
         ]
            ++ attributes
        )
        { color = Ui.Color.textLight
        , size = Ui.Config.topBar.fontSize
        }
        theIcon
