module MyFunctions.Scoreboard where

import Control.Monad.State ( StateT, gets, MonadIO(liftIO) )
import Data
    ( Game(gWhosTurn, gP1Score, gP2Score, gP1Adv, gP2Adv, gP1Name,
           gP2Name),
      Player(Player2, Player1) )
import System.Console.ANSI
    ( Color(Blue, Magenta), setCursorPosition )
import MyFunctions.MyPrintf ( printAP1, printAP2, printColorName )
import MyFunctions.Numbers
    ( score0P1,
      score0P2,
      score1P1,
      score1P2,
      score2P1,
      score2P2,
      score3P1,
      score3P2 )

scoreboard :: StateT Game IO ()
scoreboard = do 
    whosTurn <- gets gWhosTurn
    p1Score  <- gets gP1Score
    p2Score  <- gets gP2Score
    p1Adv    <- gets gP1Adv
    p2Adv    <- gets gP2Adv
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name

    liftIO $ do 
        setCursorPosition 13 37
        putStrLn "Score "

    if whosTurn == Player1 && p1Adv
        then do 
            liftIO $ do
                setCursorPosition 9 27
                printColorName Magenta p1Name 
                case p1Score of
                    0 -> score0P1
                    1 -> score1P1
                    2 -> score2P1
                    3 -> score3P1
                    _ -> score0P1

                printAP1
    
                setCursorPosition 9 45
                printColorName Blue p2Name
                case p2Score of
                    0 -> score0P2
                    1 -> score1P2
                    2 -> score2P2
                    3 -> score3P2
                    _ -> score0P2

    else if whosTurn == Player2 && p2Adv
        then do 
            liftIO $ do
                setCursorPosition 9 27
                printColorName Magenta p1Name
                case p1Score of
                    0 -> score0P1
                    1 -> score1P1
                    2 -> score2P1
                    3 -> score3P1
                    _ -> score0P1

                printAP2

                setCursorPosition 9 45
                printColorName Blue p2Name
                case p2Score of
                    0 -> score0P2
                    1 -> score1P2
                    2 -> score2P2
                    3 -> score3P2
                    _ -> score0P2

    else do
        liftIO $ do 
            setCursorPosition 9 27
            printColorName Magenta p1Name
            case p1Score of
                0 -> score0P1
                1 -> score1P1
                2 -> score2P1
                3 -> score3P1
                _ -> score0P1

            setCursorPosition 9 45
            printColorName Blue p2Name
            case p2Score of
                0 -> score0P2
                1 -> score1P2
                2 -> score2P2
                3 -> score3P2
                _ -> score0P2
