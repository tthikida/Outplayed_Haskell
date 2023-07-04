module MyFunctions.Numbers where

import System.Console.ANSI ( setCursorPosition )

p1NumX :: Int
p1NumX = 8

p1NumY :: Int
p1NumY = 20

zeroP1 :: IO ()
zeroP1 = do
    setCursorPosition p1NumY p1NumX
    putStr "####"
    setCursorPosition (p1NumY+1) p1NumX
    putStr "#  #"
    setCursorPosition (p1NumY+2) p1NumX
    putStr "#  #"
    setCursorPosition (p1NumY+3) p1NumX
    putStr "#  #"
    setCursorPosition (p1NumY+4) p1NumX
    putStr "####"

fiveP1 :: IO ()
fiveP1 = do
    setCursorPosition p1NumY p1NumX
    putStr "####"
    setCursorPosition (p1NumY+1) p1NumX
    putStr "#   "
    setCursorPosition (p1NumY+2) p1NumX
    putStr "####"
    setCursorPosition (p1NumY+3) p1NumX
    putStr "   #"
    setCursorPosition (p1NumY+4) p1NumX
    putStr "####"

tenP1 :: IO ()
tenP1 = do
    setCursorPosition p1NumY p1NumX
    putStr "#  ####"
    setCursorPosition (p1NumY+1) p1NumX
    putStr "#  #  #"
    setCursorPosition (p1NumY+2) p1NumX
    putStr "#  #  #"
    setCursorPosition (p1NumY+3) p1NumX
    putStr "#  #  #"
    setCursorPosition (p1NumY+4) p1NumX
    putStr "#  ####"

p2NumX :: Int
p2NumX = 64

p2NumY :: Int
p2NumY = 20

zeroP2 :: IO ()
zeroP2 = do
    setCursorPosition p2NumY p2NumX
    putStr "####"
    setCursorPosition (p2NumY+1) p2NumX
    putStr "#  #"
    setCursorPosition (p2NumY+2) p2NumX
    putStr "#  #"
    setCursorPosition (p2NumY+3) p2NumX
    putStr "#  #"
    setCursorPosition (p2NumY+4) p2NumX
    putStr "####"

fiveP2 :: IO ()
fiveP2 = do
    setCursorPosition p2NumY p2NumX
    putStr "####"
    setCursorPosition (p2NumY+1) p2NumX
    putStr "#   "
    setCursorPosition (p2NumY+2) p2NumX
    putStr "####"
    setCursorPosition (p2NumY+3) p2NumX
    putStr "   #"
    setCursorPosition (p2NumY+4) p2NumX
    putStr "####"


tenP2 :: IO ()
tenP2 = do
    setCursorPosition p2NumY p2NumX
    putStr "#  ####"
    setCursorPosition (p2NumY+1) p2NumX
    putStr "#  #  #"
    setCursorPosition (p2NumY+2) p2NumX
    putStr "#  #  #"
    setCursorPosition (p2NumY+3) p2NumX
    putStr "#  #  #"
    setCursorPosition (p2NumY+4) p2NumX
    putStr "#  ####"

xxxP1 :: IO ()
xxxP1 = do
    setCursorPosition p1NumY p2NumX
    putStr "######"
    setCursorPosition (p1NumY+1) p2NumX
    putStr "######"
    setCursorPosition (p1NumY+2) p2NumX
    putStr "######"
    setCursorPosition (p1NumY+3) p2NumX
    putStr "######"
    setCursorPosition (p1NumY+4) p2NumX
    putStr "######"

xxxP2 :: IO ()
xxxP2 = do
    setCursorPosition p2NumX p2NumX
    putStr "######"
    setCursorPosition (p2NumX+1) p2NumX
    putStr "######"
    setCursorPosition (p2NumX+1) p2NumX
    putStr "######"
    setCursorPosition (p2NumX+1) p2NumX
    putStr "######"
    setCursorPosition (p2NumX+1) p2NumX
    putStr "######"

scoreP1X :: Int
scoreP1X = 28

scoreP1Y :: Int
scoreP1Y = 11

score0P1 :: IO ()
score0P1 = do
    setCursorPosition scoreP1Y scoreP1X
    putStr "####"
    setCursorPosition (scoreP1Y+1) scoreP1X
    putStr "#  #"
    setCursorPosition (scoreP1Y+2) scoreP1X
    putStr "#  #"
    setCursorPosition (scoreP1Y+3) scoreP1X
    putStr "#  #"
    setCursorPosition (scoreP1Y+4) scoreP1X
    putStr "####"

score1P1 :: IO ()
score1P1 = do
    setCursorPosition scoreP1Y scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+1) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+2) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+3) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+4) scoreP1X
    putStr "   #"

score2P1 :: IO ()
score2P1 = do
    setCursorPosition scoreP1Y scoreP1X
    putStr "####"
    setCursorPosition (scoreP1Y+1) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+2) scoreP1X
    putStr "####"
    setCursorPosition (scoreP1Y+3) scoreP1X
    putStr "#  "
    setCursorPosition (scoreP1Y+4) scoreP1X
    putStr "####"

score3P1 :: IO ()
score3P1 = do
    setCursorPosition scoreP1Y scoreP1X   
    putStr "####"
    setCursorPosition (scoreP1Y+1) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+2) scoreP1X
    putStr "####"
    setCursorPosition (scoreP1Y+3) scoreP1X
    putStr "   #"
    setCursorPosition (scoreP1Y+4) scoreP1X
    putStr "####"

scoreP2X :: Int
scoreP2X = 47

scoreP2Y :: Int
scoreP2Y = 11

score0P2 :: IO ()
score0P2 = do
    setCursorPosition scoreP2Y scoreP2X
    putStr "####"
    setCursorPosition (scoreP2Y+1) scoreP2X
    putStr "#  #"
    setCursorPosition (scoreP2Y+2) scoreP2X
    putStr "#  #"
    setCursorPosition (scoreP2Y+3) scoreP2X
    putStr "#  #"
    setCursorPosition (scoreP2Y+4) scoreP2X
    putStr "####"

score1P2 :: IO ()
score1P2 = do
    setCursorPosition scoreP2Y scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+1) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+2) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+3) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+4) scoreP2X
    putStr "   #"

score2P2 :: IO ()
score2P2 = do
    setCursorPosition scoreP2Y scoreP2X
    putStr "####"
    setCursorPosition (scoreP2Y+1) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+2) scoreP2X
    putStr "####"
    setCursorPosition (scoreP2Y+3) scoreP2X
    putStr "#   "
    setCursorPosition (scoreP2Y+4) scoreP2X
    putStr "####"

score3P2 :: IO ()
score3P2 = do
    setCursorPosition scoreP2Y scoreP2X   
    putStr "####"
    setCursorPosition (scoreP2Y+1) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+2) scoreP2X
    putStr "####"
    setCursorPosition (scoreP2Y+3) scoreP2X
    putStr "   #"
    setCursorPosition (scoreP2Y+4) scoreP2X
    putStr "####"

pNumX :: Int
pNumX = 37

pNumY :: Int
pNumY = 20

zeroP :: IO ()
zeroP = do
    setCursorPosition pNumY pNumX
    putStr "####"
    setCursorPosition (pNumY+1) pNumX
    putStr "#  #"
    setCursorPosition (pNumY+2) pNumX
    putStr "#  #"
    setCursorPosition (pNumY+3) pNumX
    putStr "#  #"
    setCursorPosition (pNumY+4) pNumX
    putStr "####"

fiveP :: IO ()
fiveP = do
    setCursorPosition pNumY pNumX
    putStr "####"
    setCursorPosition (pNumY+1) pNumX
    putStr "#   "
    setCursorPosition (pNumY+2) pNumX
    putStr "####"
    setCursorPosition (pNumY+3) pNumX
    putStr "   #"
    setCursorPosition (pNumY+4) pNumX
    putStr "####"

tenP :: IO ()
tenP = do
    setCursorPosition pNumY pNumX
    putStr "#  ####"
    setCursorPosition (pNumY+1) pNumX
    putStr "#  #  #"
    setCursorPosition (pNumY+2) pNumX
    putStr "#  #  #"
    setCursorPosition (pNumY+3) pNumX
    putStr "#  #  #"
    setCursorPosition (pNumY+4) pNumX
    putStr "#  ####"

fifteenP :: IO ()
fifteenP = do
    setCursorPosition pNumY pNumX
    putStr "#  ####"
    setCursorPosition (pNumY+1) pNumX
    putStr "#  #   "
    setCursorPosition (pNumY+2) pNumX
    putStr "#  ####"
    setCursorPosition (pNumY+3) pNumX
    putStr "#     #"
    setCursorPosition (pNumY+4) pNumX
    putStr "#  ####"

twentyP :: IO ()
twentyP = do
    setCursorPosition pNumY (pNumX-2)
    putStr "####  ####"
    setCursorPosition (pNumY+1) (pNumX-2)
    putStr "   #  #  #"
    setCursorPosition (pNumY+2) (pNumX-2)
    putStr "####  #  #"
    setCursorPosition (pNumY+3) (pNumX-2)
    putStr "#     #  #"
    setCursorPosition (pNumY+4) (pNumX-2)
    putStr "####  ####"