module Data.Size exposing
    ( Size, size
    , width, height, aspectRatio
    , setHeight, setWidth, scale
    , shrinkToAspectRatio, subtractHeight, subtractWidth
    )

{-|


# Type

@docs Size, size


# Accessors

@docs width, height, aspectRatio


# Modifiers

@docs setHeight, setWidth, scale


# Operations

@docs shrinkToAspectRatio, subtractHeight, subtractWidth

-}

import Data.AspectRatio as AspectRatio exposing (AspectRatio)
import Quantity exposing (Quantity(..))



-- Types


type Size units
    = Size (Quantity Float units) (Quantity Float units)


size : Quantity Float units -> Quantity Float units -> Size units
size w h =
    Size w h



-- Accessors


width : Size units -> Quantity Float units
width (Size theWidth _) =
    theWidth


height : Size units -> Quantity Float units
height (Size _ theHeight) =
    theHeight


aspectRatio : Size units -> AspectRatio
aspectRatio (Size (Quantity theWidth) (Quantity theHeight)) =
    AspectRatio.aspectRatioUnsafe theWidth theHeight



--  Modifiers


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



-- Operations


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


{-| Subtract an amount from the height of the current size.
-}
subtractHeight : Quantity Float units -> Size units -> Size units
subtractHeight theHeight theSize =
    height theSize
        |> Quantity.minus theHeight
        |> (\newHeight -> setHeight newHeight theSize)


{-| Subtract an amount from the width of the current size.
-}
subtractWidth : Quantity Float units -> Size units -> Size units
subtractWidth theWidth theSize =
    height theSize
        |> Quantity.minus theWidth
        |> (\newWidth -> setWidth newWidth theSize)
