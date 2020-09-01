module Size exposing
    ( Size
    , aspectRatio
    , height
    , scale
    , setHeight
    , setWidth
    , shrinkToAspectRatio
    , size
    , width
    )

import AspectRatio exposing (AspectRatio)
import Quantity exposing (Quantity(..))


type Size units
    = Size (Quantity Float units) (Quantity Float units)


size : Quantity Float units -> Quantity Float units -> Size units
size w h =
    Size w h


width : Size units -> Quantity Float units
width (Size theWidth _) =
    theWidth


height : Size units -> Quantity Float units
height (Size _ theHeight) =
    theHeight


setHeight : Quantity Float units -> Size units -> Size units
setHeight theHeight (Size theWidth _) =
    size theWidth theHeight


setWidth : Quantity Float units -> Size units -> Size units
setWidth theWidth (Size _ theHeight) =
    size theWidth theHeight


scale : Float -> Size units -> Size units
scale amount (Size oldWidth oldHeight) =
    size
        (Quantity.multiplyBy amount oldWidth)
        (Quantity.multiplyBy amount oldHeight)


{-| Change the aspect ratio of the current size but make sure that the new size remains in the same bounding box as the
original size object.
-}
shrinkToAspectRatio : AspectRatio -> Size units -> Size units
shrinkToAspectRatio newRatio theSize =
    let
        maxDimension =
            Quantity.max (width theSize) (height theSize)

        unscaledSize =
            size
                (Quantity.multiplyBy (AspectRatio.xNormalizedBelowOne newRatio) maxDimension)
                (Quantity.multiplyBy (AspectRatio.yNormalizedBelowOne newRatio) maxDimension)

        scaleRatio =
            min
                (Quantity.ratio (width theSize) (width unscaledSize))
                (Quantity.ratio (height theSize) (height unscaledSize))
    in
    scale scaleRatio unscaledSize


aspectRatio : Size units -> AspectRatio
aspectRatio (Size (Quantity theWidth) (Quantity theHeight)) =
    AspectRatio.aspectRatioUnsafe theWidth theHeight
