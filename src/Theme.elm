module Theme exposing (palette, size)

{-| Theme information about the environment.

@docs palette, size

-}

import Element exposing (Color, Element)


palette :
    { foreground : Color
    , background : Color
    , primary : Color
    , secondary : Color
    , tertiary : Color
    }
palette =
    { background = Element.rgb255 255 251 224
    , foreground = Element.rgb255 38 23 34
    , primary = Element.rgb255 159 121 164
    , secondary = Element.rgb255 227 156 152
    , tertiary = Element.rgb255 224 255 191
    }


size : { medium : Int, small : Int }
size =
    { medium = 32
    , small = 12
    }
