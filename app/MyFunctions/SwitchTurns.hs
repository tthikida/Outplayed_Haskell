module MyFunctions.SwitchTurns where

import Data ( Player(..) )

switchTurns :: Player -> Player
switchTurns p = 
    if p == Player1 
    then Player2 
    else Player1