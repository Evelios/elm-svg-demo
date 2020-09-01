module Theme exposing (palette, size)

{-| Theme information about the environment.

@docs palette, size

-}

import Element exposing (Color, Element)


palette : { foreground : Color, background : Color }
palette =
    { background = Element.rgb 1 1 1
    , foreground = Element.rgb 0 0 0
    }


size : { body : Int }
size =
    { body = 32 }
