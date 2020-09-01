module Component exposing (icon)

{-| Viewable objects.
-}

import Color
import Element exposing (Element)
import Material.Icons.Action
import Svg
import Theme


icon : { settings : Element msg }
icon =
    let
        toIcon svg =
            Element.html <| Svg.svg [] [ svg ]

        color { red, green, blue, alpha } =
            Color.rgba red green blue alpha
    in
    { settings =
        toIcon
            (Material.Icons.Action.settings
                (color <| Element.toRgb Theme.palette.foreground)
                Theme.size.body
            )
    }
