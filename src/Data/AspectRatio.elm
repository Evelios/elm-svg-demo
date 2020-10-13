module Data.AspectRatio exposing
    ( AspectRatio
    , aspectRatio, aspectRatioUnsafe
    , x, y
    , xNormalizedBelowOne, xNormalizedAboveOne, yNormalizedBelowOne, yNormalizedAboveOne
    , smallestBelowOne
    , equal
    )

{-|


# Type

@docs AspectRatio


# Constructors

@docs aspectRatio, aspectRatioUnsafe


# Accessors

@docs x, y

@docs xNormalizedBelowOne, xNormalizedAboveOne, yNormalizedBelowOne, yNormalizedAboveOne

@docs smallestBelowOne


# Operations

@docs equal

-}


type AspectRatio
    = AspectRatio Float Float



-- Constructors


aspectRatio : Float -> Float -> Maybe AspectRatio
aspectRatio xin yin =
    case xin > 0 || yin > 0 of
        True ->
            Just <| aspectRatioUnsafe xin yin

        False ->
            Nothing


aspectRatioUnsafe : Float -> Float -> AspectRatio
aspectRatioUnsafe xin yin =
    AspectRatio xin yin



-- Accessors


{-| Alias for xNormalizedBelowOne
-}
x : AspectRatio -> Float
x =
    xNormalizedBelowOne


{-| Alias for yNormalizedBelowOne
-}
y : AspectRatio -> Float
y =
    yNormalizedBelowOne


{-|


    aspect =
        aspectRatio 2 3
            |> xNormalizedAboveOne

    --> 1

-}
xNormalizedAboveOne : AspectRatio -> Float
xNormalizedAboveOne (AspectRatio xVal yVal) =
    xVal / min xVal yVal


{-|


    aspect =
        aspectRatio 2 3
            |> yNormalizedAboveOne

    --> 1.5

-}
yNormalizedAboveOne : AspectRatio -> Float
yNormalizedAboveOne (AspectRatio xVal yVal) =
    yVal / min xVal yVal


{-|


    aspect =
        aspectRatio 2 3
            |> xNormalizedBelowOne

    --> 0.66

-}
xNormalizedBelowOne : AspectRatio -> Float
xNormalizedBelowOne (AspectRatio xVal yVal) =
    xVal / max xVal yVal


{-|


    aspect =
        aspectRatio 2 3
            |> yNormalizedBelowOne

    --> 1

-}
yNormalizedBelowOne : AspectRatio -> Float
yNormalizedBelowOne (AspectRatio xVal yVal) =
    yVal / max xVal yVal


{-| -}
smallestBelowOne : AspectRatio -> Float
smallestBelowOne ratio =
    min (xNormalizedBelowOne ratio) (yNormalizedBelowOne ratio)



-- Operations


equal : AspectRatio -> AspectRatio -> Bool
equal first second =
    xNormalizedAboveOne first
        == xNormalizedAboveOne second
        && yNormalizedAboveOne first
        == yNormalizedAboveOne second
