module MyFunctions.DisplayGuesses where

import Control.Monad.State ( StateT, gets, MonadIO(liftIO) )
import Data
    ( Game(gWhosTurn, gP1Name, gP2Name, gP1Num, gP2Num, gTotal,
           gPAnswer),
      Player(..) )
import System.Console.ANSI
    ( Color(Magenta, Cyan), setCursorPosition )
import MyFunctions.MyPrintf ( printColorName )
import MyFunctions.Numbers
    ( fifteenP,
      fiveP,
      fiveP1,
      fiveP2,
      tenP,
      tenP1,
      tenP2,
      twentyP,
      xxxP1,
      xxxP2,
      zeroP,
      zeroP1,
      zeroP2 )

displayGuesses :: StateT Game IO ()
displayGuesses = do
    
    whosTurn <- gets gWhosTurn
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name
    p1Num    <- gets gP1Num
    p2Num    <- gets gP2Num
    total    <- gets gTotal
    pAns     <- gets gPAnswer 

    if whosTurn == Player1 
    then do
        liftIO $ do 
            pickedNumber Player1 p1Num
            pickedNumber Player2 p2Num
            
            setCursorPosition 18 34
            printColorName Cyan p2Name -- p2 needs to be here to display at the correct time
            putStrLn " guessed"
            case pAns of
                0  -> zeroP
                5  -> fiveP
                10 -> tenP
                15 -> fifteenP
                20 -> twentyP
                _  -> zeroP
    else do
        liftIO $ do
            pickedNumber Player1 p1Num
            pickedNumber Player2 p2Num
            
            setCursorPosition 18 34
            printColorName Magenta p1Name -- p1 needs to be here to display at the correct time
            putStrLn " guessed"
            case pAns of
                0  -> zeroP
                5  -> fiveP
                10 -> tenP
                15 -> fifteenP
                20 -> twentyP
                _  -> zeroP

pickedNumber :: Player -> Int  -> IO()
pickedNumber p n = do
    if p == Player1
        then do
            case n of
                0  -> zeroP1
                5  -> fiveP1
                10 -> tenP1
                _  -> xxxP1
    else do
            case n of
                0  -> zeroP2
                5  -> fiveP2
                10 -> tenP2
                _  -> xxxP2