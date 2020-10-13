module List.Extra exposing (appendIf)

{-| Extra list functions.
-}


{-| Append an element to a list if the condition is true.
-}
appendIf : Bool -> a -> List a -> List a
appendIf bool ele list =
    case bool of
        True ->
            list ++ [ ele ]

        False ->
            list
