module Component exposing (topBar, settings, icon, iconButton, imageView)

{-| Viewable objects.

@docs topBar, settings, icon, iconButton, imageView

-}

import Color
import Element exposing (Attribute, Element)
import Element.Background
import Element.Events
import Html.Attributes
import Material.Icons.Action
import Svg
import Theme


topBar :
    { title : String
    , toggleSettings : msg
    }
    -> Element msg
topBar { title, toggleSettings } =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.Background.color Theme.palette.primary
        , Element.padding Theme.size.small
        , Element.spacing Theme.size.medium
        ]
        [ Element.text title
        , Element.el
            [ Element.alignRight ]
            (iconButton
                { label = icon.settings
                , action = toggleSettings
                }
            )
        ]


settings : List (Element msg) -> Element msg
settings elements =
    Element.column
        [ Element.height Element.fill
        , Element.Background.color Theme.palette.secondary
        , Element.alignRight
        , Element.paddingXY Theme.size.medium Theme.size.small
        , Element.spacing Theme.size.small
        ]
        (Element.text "Settings" :: elements)


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


imageView : Element msg
imageView =
    let
        block =
            Element.el
                [ Element.width Element.fill
                , Element.height Element.fill
                , Element.Background.color Theme.palette.tertiary
                ]
                Element.none

        xPad =
            Element.el
                [ Element.width <| Element.fillPortion 1
                , Element.height Element.fill
                ]
                Element.none

        yPad =
            Element.el
                [ Element.height <| Element.fillPortion 1
                , Element.width Element.fill
                ]
                Element.none
    in
    Element.row
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ xPad
        , Element.column
            [ Element.width <| Element.fillPortion 8
            , Element.height Element.fill
            ]
            [ yPad
            , Element.el
                [ Element.height <| Element.fillPortion 8
                , Element.width <| Element.fill
                ]
                block
            , yPad
            ]
        , xPad
        ]
