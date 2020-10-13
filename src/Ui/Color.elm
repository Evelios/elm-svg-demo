module Ui.Color exposing (background, primary, secondary, textDark, textLight, uiBackground)

{-| -}

import Element
import Ui.Config



-- Colors


{-| -}
uiBackground : Element.Color
uiBackground =
    Ui.Config.color.almostBlack


{-| -}
background : Element.Color
background =
    Ui.Config.color.almostWhite


{-| -}
primary : Element.Color
primary =
    Ui.Config.color.purple


{-| -}
secondary : Element.Color
secondary =
    Ui.Config.color.green



-- Text Colors


textDark : Element.Color
textDark =
    Ui.Config.color.black


textLight : Element.Color
textLight =
    Ui.Config.color.white
