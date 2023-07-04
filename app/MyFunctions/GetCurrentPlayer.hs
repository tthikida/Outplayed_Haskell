module MyFunctions.GetCurrentPlayer where

import Data ( Player(Player1) )

getCurrentPlayer :: Player -> String -> String -> String
getCurrentPlayer p p1Name p2Name = 
    if p == Player1 
    then p1Name 
    else p2Name