module MyFunctions.PlayGame where

import Control.Monad.State ( gets, StateT )
import Data
    ( Game(gP1Name, gP2Name, gGameStarted, gWhosTurn),
      Player(Player1) )
import Setup ( setup )
import MyFunctions.GetInputsAndTotal
    ( getInputsAndTotal_P1First, getInputsAndTotal_P2First )
import MyFunctions.Rendering ( renderScene )
import MyFunctions.ProcessInputs ( processInputs )


playGame :: StateT Game IO ()
playGame = do
    p1Name      <- gets gP1Name
    p2Name      <- gets gP2Name
    gameStarted <- gets gGameStarted
     
    if  not gameStarted
    then do 
        setup
        playGame
    else do
        whosTurn  <- gets gWhosTurn
        renderScene

        if whosTurn == Player1
        then do
            getInputsAndTotal_P1First
            processInputs
            playGame
        else do
            getInputsAndTotal_P2First
            processInputs
            playGame