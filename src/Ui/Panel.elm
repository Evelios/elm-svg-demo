module Ui.Panel exposing (panel, header, break)

{-| A large vertical section on a webpage. This is generally intended to be a
navigation or settings section


# Elements

@docs panel, header, break

-}

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Ui.Color
import Ui.Color.Extra
import Ui.Config


{-| -}
panel : List (Attribute msg) -> List (Element msg) -> Element msg
panel attributes elements =
    column
        ([ width <| px Ui.Config.panel.width
         , height <| fill
         , padding <| Ui.Config.panel.padding
         , spacing <| Ui.Config.panel.spacingY
         , Background.color <| Ui.Color.Extra.lighten 0.05 Ui.Color.background
         , Border.color <| Ui.Color.Extra.lighten 0.3 Ui.Color.uiBackground
         , Border.widthEach
            { left = 2
            , right = 2
            , top = 0
            , bottom = 0
            }
         ]
            ++ attributes
        )
        elements


{-|

    panelHeader =
        header [] <| text "Panel Header"

-}
header : List (Attribute msg) -> Element msg -> Element msg
header attributes ele =
    el
        ([ Font.semiBold
         , centerX
         ]
            ++ attributes
        )
        ele


{-| A panel section break.
-}
break : Element msg
break =
    el
        [ width fill
        , height <| px 2
        , Background.color <| Ui.Color.Extra.lighten 0.25 Ui.Color.primary
        ]
        none
