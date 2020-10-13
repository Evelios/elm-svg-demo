module Ui.Config exposing (config)

{-| -}

import Element
import Ui.Color.Extra exposing (hexToColor)


config :
    { color :
        { black : Element.Color
        , white : Element.Color
        , almostBlack : Element.Color
        , almostWhite : Element.Color
        , purple : Element.Color
        , green : Element.Color
        }
    , topBar :
        { height : Int
        , fontSize : Int
        , paddingX : Int
        }
    }
config =
    { color =
        { black = hexToColor "#000000"
        , white = hexToColor "#ffffff"
        , almostBlack = hexToColor "#393e41"
        , almostWhite = hexToColor "#f7ebe8"
        , purple = hexToColor "#cc76a1"
        , green = hexToColor "#59c9a5"
        }
    , topBar =
        { height = 48
        , fontSize = 24
        , paddingX = 18
        }
    }
