module Ui.Color.Extra exposing (fromColor, hexToColor, toColor)

{-| Converts a string to a color.
-}

import Color
import Color.Convert
import Element


{-| Convert a Color.Color into an Element.Color
-}
fromColor : Color.Color -> Element.Color
fromColor elementColor =
    let
        cl =
            Color.toRgba elementColor
    in
    Element.rgba cl.red cl.green cl.blue cl.alpha


{-| Convert an Element.Color into a Color.Color
-}
toColor : Element.Color -> Color.Color
toColor elementColor =
    let
        cl =
            Element.toRgb elementColor
    in
    Color.rgba cl.red cl.green cl.blue cl.alpha


hexToColor : String -> Element.Color
hexToColor string =
    let
        cl =
            Color.Convert.hexToColor string
    in
    fromColor <| Result.withDefault (Color.rgb 0 0 0) cl
