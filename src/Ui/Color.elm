module Ui.Color exposing (Theme(..), background, foreground, oppositeTheme, primary, secondary, text)

{-| -}

import Element
import Ui.Config exposing (config)


{-| -}
type Theme
    = Dark
    | Light


{-| -}
type Role
    = Foreground
    | Background
    | Primary
    | Secondary


{-| -}
color : Theme -> Role -> Element.Color
color theme role =
    case role of
        Background ->
            case theme of
                Dark ->
                    config.color.almostBlack

                Light ->
                    config.color.almostWhite

        Foreground ->
            case theme of
                Dark ->
                    config.color.white

                Light ->
                    config.color.black

        Primary ->
            config.color.purple

        Secondary ->
            config.color.green



-- Colors


{-| -}
foreground : Element.Color
foreground =
    color Dark Foreground


{-| -}
background : Element.Color
background =
    color Dark Background


{-| -}
primary : Element.Color
primary =
    color Dark Primary


{-| -}
secondary : Element.Color
secondary =
    color Dark Secondary



-- Text Colors


text : Theme -> Element.Color
text theme =
    color theme Foreground



-- Theme


oppositeTheme : Theme -> Theme
oppositeTheme theme =
    case theme of
        Dark ->
            Light

        Light ->
            Dark
