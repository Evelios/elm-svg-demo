module Generative exposing (render)

{-|

@docs render

-}

import Collage exposing (Collage)
import Collage.Render
import Data.AspectRatio as AspectRatio exposing (AspectRatio)
import Element exposing (Element)
import Svg.Attributes


{-| -}
render : AspectRatio -> (AspectRatio -> Collage msg) -> Element msg
render ratio picture =
    let
        viewBox =
            [ String.fromFloat -(AspectRatio.xNormalizedBelowOne ratio)
            , String.fromFloat -(AspectRatio.yNormalizedBelowOne ratio)
            , String.fromFloat <| 2 * AspectRatio.xNormalizedBelowOne ratio
            , String.fromFloat <| 2 * AspectRatio.yNormalizedBelowOne ratio
            ]
                |> String.join " "
    in
    Collage.Render.svgExplicit
        [ Svg.Attributes.viewBox viewBox
        ]
        (picture ratio)
        |> Element.html
