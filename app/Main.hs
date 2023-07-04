module Main where

import Data ( mkGame )
import MyFunctions.PlayGame ( playGame )
import Control.Monad.State ( StateT(runStateT) )
import MyFunctions.GameOver ( gameOver )

main :: IO ()
main = do
    game <- mkGame
    runStateT playGame game
    gameOver