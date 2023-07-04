module MyFunctions.PlayersWrong where

import Control.Monad.State ( gets, modify, StateT )
import Data
    ( Game(gP1Name, gP2Name, gWhosTurn, gP1Adv, gP2Adv, gMessage),
      MsgType(Wrong, LostAdvantage) )
import MyFunctions.SwitchTurns ( switchTurns )

playersWrong :: StateT Game IO ()
playersWrong = do
    p1Adv    <- gets gP1Adv
    p2Adv    <- gets gP2Adv
    whosTurn <- gets gWhosTurn
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name
    
    if p1Adv || p2Adv
    then do
        modify (\p -> p { gWhosTurn = switchTurns whosTurn
                        , gP1Adv   = False
                        , gP2Adv   = False
                        , gMessage = LostAdvantage
                        })
    else do 
        modify (\p -> p { gWhosTurn = switchTurns whosTurn
                        , gP1Adv = False
                        , gP2Adv = False
                        , gMessage = Wrong
                        })