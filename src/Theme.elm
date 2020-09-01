module Theme exposing (palette)

{-| Theme information about the environment.

@docs palette

-}

import Element exposing (Color)


palette : { foreground : Color, background : Color }
palette =
    { background = Element.rgb 1 1 1
    , foreground = Element.rgb 0 0 0
    }
