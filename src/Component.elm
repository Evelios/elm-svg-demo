module Component exposing (topBar, icon)

{-| Viewable objects.

@docs topBar, icon, iconButton

-}

import Color
import Element exposing (Attribute, Element)
import Element.Background
import Element.Events
import Html.Attributes
import Material.Icons.Action
import Svg
import Theme


topBar : { title : String } -> Element msg
topBar { title } =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.Background.color Theme.palette.primary
        , Element.padding Theme.size.small
        , Element.spacing Theme.size.medium
        ]
        [ icon.settings
        , Element.text title
        ]


icon :
    { settings : Element msg
    }
icon =
    let
        toIcon svg =
            let
                iconSize =
                    32
            in
            Element.html <|
                Svg.svg
                    [ Html.Attributes.width iconSize
                    , Html.Attributes.height iconSize
                    ]
                    [ svg ]

        color { red, green, blue, alpha } =
            Color.rgba red green blue alpha
    in
    { settings =
        toIcon
            (Material.Icons.Action.settings
                (color <| Element.toRgb Theme.palette.foreground)
                Theme.size.medium
            )
    }


iconButton :
    { label : Element msg
    , action : msg
    }
    -> Element msg
iconButton { label, action } =
    Element.el
        [ Element.Events.onClick action
        , Element.pointer
        ]
        label
