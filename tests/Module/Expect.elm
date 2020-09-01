module Module.Expect exposing (..)

import AspectRatio exposing (AspectRatio)
import Expect exposing (Expectation, FloatingPointTolerance(..))
import Geometry.Expect
import Size exposing (Size)


size : Size units -> Size units -> Expectation
size first =
    Expect.all
        [ Geometry.Expect.quantity (Size.width first) << Size.width
        , Geometry.Expect.quantity (Size.height first) << Size.height
        ]


aspectRatio : AspectRatio -> AspectRatio -> Expectation
aspectRatio first =
    Expect.all
        [ Expect.within (Absolute 0.000001) (AspectRatio.xNormalizedBelowOne first) << AspectRatio.xNormalizedBelowOne
        , Expect.within (Absolute 0.000001) (AspectRatio.yNormalizedBelowOne first) << AspectRatio.yNormalizedBelowOne
        ]
