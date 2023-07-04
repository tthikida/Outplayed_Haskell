module MyFunctions.P2ScorePoint where

import Control.Monad.State
    ( gets, modify, MonadIO(liftIO), StateT )
import Data
    ( Game(gP2Name, gP2Score, gGameStarted, gP2Adv, gMessage),
      MsgType(Point, Win) )
import MyFunctions.MyPrintf ( printPlayerWins )
import MyFunctions.Rendering (renderScene)

p2ScorePoint :: StateT Game IO ()
p2ScorePoint = do
    p2Name   <- gets gP2Name
    p2Score  <- gets gP2Score

    modify (\b -> b {gP2Score = p2Score + 1, gP2Adv = False})
    newScore <- gets gP2Score

    if newScore == 3
    then do 
        modify (\w -> w {gMessage  = Win})
        renderScene
        liftIO $ do 
            printPlayerWins p2Name
            putStrLn "X      Press Enter to start again"
        _ <- liftIO getLine
        modify (\w -> w {gGameStarted = False, gP2Adv = False})
    else do
        modify (\w -> w {gMessage = Point})