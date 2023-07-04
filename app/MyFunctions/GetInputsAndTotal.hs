module MyFunctions.GetInputsAndTotal where

import Control.Monad.State ( gets, modify, StateT )
import Data
    ( Game(gP1Name, gP2Name, gWhosTurn, gTotal, gP1Num, gP2Num,
           gPAnswer),
      Player(Player1, Player2) )
import System.Console.ANSI ()
import MyFunctions.GetNumber ( getNumber )
import MyFunctions.GetAnswer ( getAnswer )

getInputsAndTotal_P1First :: StateT Game IO ()
getInputsAndTotal_P1First = do
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name
    whosTurn <- gets gWhosTurn

    p1Guess <- getNumber Player1
    p2Guess <- getNumber Player2
    pAnswer <- getAnswer p1Name p2Name whosTurn
    
    let total = read p1Guess + read p2Guess
    modify (\a -> a { gTotal   = total
                    , gP1Num   = read p1Guess
                    , gP2Num   = read p2Guess
                    , gPAnswer = read pAnswer
                    })

getInputsAndTotal_P2First :: StateT Game IO ()
getInputsAndTotal_P2First = do
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name
    whosTurn <- gets gWhosTurn

    p2Guess <- getNumber Player2
    p1Guess <- getNumber Player1
    pAnswer <- getAnswer p1Name p2Name whosTurn
    
    let total = read p1Guess + read p2Guess
    modify (\a -> a { gTotal   = total
                    , gP1Num   = read p1Guess
                    , gP2Num   = read p2Guess
                    , gPAnswer = read pAnswer
                    })