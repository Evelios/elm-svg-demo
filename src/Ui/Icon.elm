module Ui.Icon exposing
    ( Icon, render
    , settings
    )

{-|


# Icon Basics

@docs Icon, render


# Icons

@docs settings

-}

import Color exposing (Color)
import Element exposing (Attribute, Element)
import Material.Icons.Action
import Svg exposing (Svg)
import Svg.Attributes
import Ui.Color.Extra


type Icon msg
    = Icon (Color -> Int -> Svg msg)


{-| -}
render :
    List (Attribute msg)
    -> { color : Element.Color, size : Int }
    -> Icon msg
    -> Element msg
render attributes { color, size } (Icon icon) =
    Svg.svg
        [ Svg.Attributes.width <| String.fromInt size
        , Svg.Attributes.height <| String.fromInt size
        ]
        [ icon
            (Ui.Color.Extra.toColor color)
            size
        ]
        |> Element.html
        |> Element.el attributes



-- Icons


{-| -}
settings : Icon msg
settings =
    Icon Material.Icons.Action.settings
