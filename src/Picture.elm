module Picture exposing (..)

import Collage exposing (..)
import Color
import Data.AspectRatio as AspectRatio exposing (AspectRatio)


picture : AspectRatio -> Collage msg
picture ratio =
    circle (AspectRatio.smallestBelowOne ratio)
        |> filled (uniform <| Color.rgb 0.5 0.2 0.7)
