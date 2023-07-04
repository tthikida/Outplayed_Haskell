module MyFunctions.ProcessInputs where

import MyFunctions.PlayersWrong ( playersWrong )
import MyFunctions.P1ScorePoint ( p1ScorePoint )
import MyFunctions.P2ScorePoint ( p2ScorePoint )
import Data
    ( Game(gWhosTurn, gTotal,gPAnswer, gP2Adv, gP1Adv, gMessage),
      MsgType(Advantage),
      Player(Player2, Player1) )
import Control.Monad.State ( gets, modify, StateT )

processInputs :: StateT Game IO ()
processInputs = do
    whosTurn <- gets gWhosTurn
    p1Adv    <- gets gP1Adv
    p2Adv    <- gets gP2Adv
    total    <- gets gTotal
    pAns     <- gets gPAnswer

    -- player 1 guess correct
    if      total == pAns && whosTurn == Player1
    then do 
        if p1Adv
        then do
            p1ScorePoint
        else do
            modify (\b -> b {gP1Adv = True, gP2Adv = False, gMessage = Advantage})

    -- player 2 guess correct  
    else if total == pAns && whosTurn == Player2
    then do 
        if p2Adv
        then do
            p2ScorePoint
        else do
            modify (\b -> b {gP2Adv = True, gP1Adv = False, gMessage = Advantage})
    
    else do
        playersWrong 