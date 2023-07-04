module MyFunctions.P1ScorePoint where

import Control.Monad.State
    ( gets, modify, MonadIO(liftIO), StateT )
import Data
    ( Game(gP1Name, gP1Score, gGameStarted, gP1Adv, gMessage),
      MsgType(Point, Win) )
import MyFunctions.MyPrintf ( printPlayerWins )
import MyFunctions.Rendering (renderScene)

p1ScorePoint :: StateT Game IO ()
p1ScorePoint = do
    p1Name   <- gets gP1Name
    p1Score  <- gets gP1Score

    modify (\b -> b {gP1Score = p1Score + 1, gP1Adv = False})
    newScore <- gets gP1Score

    if newScore == 3
    then do 
        modify (\w -> w {gMessage = Win})
        renderScene
        liftIO $ do 
            printPlayerWins p1Name 
            putStrLn "X      Press Enter to start again"
        _ <- liftIO getLine
        modify (\w -> w {gGameStarted = False, gP1Adv = False})
    else do
        modify (\w -> w {gMessage = Point})