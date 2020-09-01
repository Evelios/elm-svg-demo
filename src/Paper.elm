module Paper exposing
    ( paper
    , size, height, width, aspectRatio
    , a0, a1, a2, a3, a4
    , letter
    , Orientation(..), Paper
    )

{-| This library contains a bunch of standard paper format sizes. These
paper sizes are all given according to the orientation of the paper,
either Landscape or Portrait. The paper sizes are given using the units
module so the sizes are independent of any unit system and can be
translated into any unit system you would like.


# Types

@docs Paper Orientation


# Builders

@docs paper


# Accessors

@docs size, height, width, aspectRatio


# Paper Sizes


## Metric

@docs a0, a1, a2, a3, a4


## Imperial

@docs letter

-}

import AspectRatio exposing (AspectRatio)
import Length exposing (Length, Meters)
import Quantity
import Size exposing (Size)


type Paper
    = Paper Length Length


type Orientation
    = Landscape
    | Portrait



---- Builders ----------------------------------------------------------------------------------------------------------


paper : Length -> Length -> Paper
paper a b =
    let
        larger =
            Quantity.max a b

        smaller =
            Quantity.min a b
    in
    Paper larger smaller



---- Accessors  ----------------------------------------------------------------------------------------------------------


size : Orientation -> Paper -> Size Meters
size orientation (Paper larger smaller) =
    case orientation of
        Landscape ->
            Size.size larger smaller

        Portrait ->
            Size.size smaller larger


height : Orientation -> Paper -> Length
height orientation thePaper =
    size orientation thePaper
        |> Size.height


width : Orientation -> Paper -> Length
width orientation thePaper =
    size orientation thePaper
        |> Size.width


aspectRatio : Orientation -> Paper -> AspectRatio
aspectRatio orientation thePaper =
    size orientation thePaper
        |> Size.aspectRatio



---- Paper Sizes -------------------------------------------------------------------------------------------------------
--
---- Metric ----


a0 : Paper
a0 =
    paper (Length.millimeters 841) (Length.millimeters 1189)


a1 : Paper
a1 =
    paper (Length.millimeters 594) (Length.millimeters 841)


a2 : Paper
a2 =
    paper (Length.millimeters 420) (Length.millimeters 594)


a3 : Paper
a3 =
    paper (Length.millimeters 297) (Length.millimeters 420)


a4 : Paper
a4 =
    paper (Length.millimeters 210) (Length.millimeters 297)



---- Imperial ----


letter : Paper
letter =
    paper (Length.inches 8.5) (Length.inches 11)
