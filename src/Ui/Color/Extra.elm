module Ui.Color.Extra exposing
    ( fromColor, toColor
    , saturate, desaturate, lighten, darken
    , hexToColor
    )

{-| Converts a string to a color.


# Type Conversions

@docs fromColor, toColor


# Modifications

@docs saturate, desaturate, lighten, darken


# Format Conversions

@docs hexToColor

-}

import Color
import Color.Convert
import Color.Manipulate
import Element



-- Type Conversions


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



-- Modifications


{-| Increase the saturation of a color
-}
saturate : Float -> Element.Color -> Element.Color
saturate offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.saturate offset cl


{-| Decrease the saturation of a color
-}
desaturate : Float -> Element.Color -> Element.Color
desaturate offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.desaturate offset cl


{-| Increase the lightning of a color
-}
lighten : Float -> Element.Color -> Element.Color
lighten offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.lighten offset cl


{-| Decrease the lightning of a color
-}
darken : Float -> Element.Color -> Element.Color
darken offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.darken offset cl



-- Format Conversions


hexToColor : String -> Element.Color
hexToColor string =
    let
        cl =
            Color.Convert.hexToColor string
    in
    fromColor <| Result.withDefault (Color.rgb 0 0 0) cl
