module Tests.Size exposing (..)

import AspectRatio exposing (AspectRatio)
import Expect
import Module.Expect
import Pixels exposing (Pixels)
import Size exposing (Size)
import Test exposing (Test, describe, test)


scale : Test
scale =
    test "Positive" <|
        \_ ->
            let
                size =
                    Size.size (Pixels.pixels 100) (Pixels.pixels 200)

                expected =
                    Size.size (Pixels.pixels 200) (Pixels.pixels 400)

                actual =
                    Size.scale 2 size
            in
            Expect.equal expected actual


aspectRatioTest : Test
aspectRatioTest =
    describe "Aspect ratio"
        [ test "from portrait size" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 100) (Pixels.pixels 150)

                    actual =
                        AspectRatio.aspectRatioUnsafe 1 1.5
                in
                Size.aspectRatio size
                    |> Module.Expect.aspectRatio actual
        , test "from landscape size" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 150) (Pixels.pixels 100)

                    expected =
                        AspectRatio.aspectRatioUnsafe 1.5 1
                in
                Size.aspectRatio size
                    |> Module.Expect.aspectRatio expected
        ]


shrinkToAspectRatio : Test
shrinkToAspectRatio =
    describe "shrinkToAspectRatio"
        [ test "Portrait from square" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 200) (Pixels.pixels 200)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 1 2

                    expected =
                        Size.size (Pixels.pixels 100) (Pixels.pixels 200)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Expect.equal expected
        , test "Landscape from square" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 200) (Pixels.pixels 200)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 2 1

                    expected =
                        Size.size (Pixels.pixels 200) (Pixels.pixels 100)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Expect.equal expected
        , test "Landscape to portrait" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 200) (Pixels.pixels 100)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 1 2

                    expected =
                        Size.size (Pixels.pixels 50) (Pixels.pixels 100)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Expect.equal expected
        , test "Portrait to landscape" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 100) (Pixels.pixels 200)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 2 1

                    expected =
                        Size.size (Pixels.pixels 100) (Pixels.pixels 50)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Expect.equal expected
        , test "Non-normalized aspect ratio portrait to landscape" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 300) (Pixels.pixels 400)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 3 2

                    expected =
                        Size.size (Pixels.pixels 300) (Pixels.pixels 200)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Module.Expect.size expected
        , test "Non-normalized aspect ratio landscape to portrait" <|
            \_ ->
                let
                    size =
                        Size.size (Pixels.pixels 400) (Pixels.pixels 300)

                    aspectRatio =
                        AspectRatio.aspectRatioUnsafe 2 3

                    expected =
                        Size.size (Pixels.pixels 200) (Pixels.pixels 300)
                in
                Size.shrinkToAspectRatio aspectRatio size
                    |> Module.Expect.size expected
        ]
