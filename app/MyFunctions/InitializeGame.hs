module MyFunctions.InitializeGame where

import Data
    ( Game(gGameStarted, gP1Num, gP2Num, gTotal, gP1Adv, gP2Adv,
           gWhosTurn, gP1Score, gP2Score, gMessage),
      MsgType(Default),
      Player(Player1) )
import Control.Monad.State ( StateT, modify, MonadIO(liftIO) )
import System.IO
    ( hSetBuffering, hSetEcho, stdin, BufferMode(NoBuffering) )

initializeGame :: StateT Game IO ()
initializeGame = do
    liftIO $ do 
        hSetBuffering stdin NoBuffering
        hSetEcho stdin False
    modify (\b -> b { gGameStarted = True
                    , gP1Num     = 0
                    , gP2Num     = 0
                    , gTotal     = 0
                    , gP1Adv     = False
                    , gP2Adv     = False
                    , gWhosTurn  = Player1
                    , gP1Score   = 0
                    , gP2Score   = 0
                    , gMessage   = Default
                    })
    