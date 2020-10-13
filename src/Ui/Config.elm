module Ui.Config exposing (color, panel, topBar)

{-| -}

import Element
import Ui.Color.Extra exposing (hexToColor)


color :
    { black : Element.Color
    , white : Element.Color
    , almostBlack : Element.Color
    , almostWhite : Element.Color
    , purple : Element.Color
    , green : Element.Color
    }
color =
    { black = hexToColor "#000000"
    , white = hexToColor "#ffffff"
    , almostBlack = hexToColor "#393e41"
    , almostWhite = hexToColor "#f7ebe8"
    , purple = hexToColor "#cc76a1"
    , green = hexToColor "#59c9a5"
    }


font :
    { header : Int
    , large : Int
    , medium : Int
    }
font =
    { header = 24
    , large = 18
    , medium = 12
    }


topBar :
    { height : Int
    , fontSize : Int
    , paddingX : Int
    }
topBar =
    { height = 48
    , fontSize = 24
    , paddingX = 18
    }


panel :
    { width : Int
    , padding : Int
    , spacingY : Int
    }
panel =
    { width = 250
    , padding = 24
    , spacingY = 12
    }
