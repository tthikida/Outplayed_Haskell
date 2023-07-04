module Data where

import Control.Monad.State ( StateT )

type World a = StateT Game IO a

newtype P1Score = P1Score { getP1Score :: Int}   deriving (Show , Eq )
newtype P2Score = P2Score { getP2Score :: Int}   deriving (Show , Eq )

data Player = Player1 | Player2 deriving (Show , Eq )
data MsgType = Invalid | Advantage | LostAdvantage | Wrong | Point | Win | Default deriving Show

data Game = Game 
    {
          gGameStarted   :: Bool
        , gP1Adv         :: Bool
        , gP2Adv         :: Bool
        , gP1Score       :: Int
        , gP2Score       :: Int
        , gP1Num         :: Int
        , gP2Num         :: Int
        , gTotal         :: Int
        , gPAnswer       :: Int
        , gWhosTurn      :: Player
        , gP1Name        :: String
        , gP2Name        :: String
        , gMessage       :: MsgType
    } deriving Show

mkGame :: IO Game
mkGame = do
    return $ Game {
          gGameStarted   = False
        , gP1Adv         = False
        , gP2Adv         = False
        , gP1Score       = 0
        , gP2Score       = 0
        , gP1Num         = 0
        , gP2Num         = 0
        , gTotal         = 0
        , gPAnswer       = 0
        , gWhosTurn      = Player1
        , gP1Name        = "Player 1"
        , gP2Name        = "Player 2"
        , gMessage       = Default
    }