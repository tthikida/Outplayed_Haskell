module MyFunctions.MyPrintf where

import System.Console.ANSI
    ( Color(Green, Red),
      setCursorPosition,
      setSGR,
      ColorIntensity(Vivid),
      ConsoleLayer(Foreground),
      SGR(Reset, SetColor) )

printColorName :: Color -> String -> IO ()
printColorName color name = do    
    setSGR [SetColor Foreground Vivid color]
    putStr name
    setSGR [Reset]

printColorString :: Color -> String -> IO ()
printColorString color str = do    
    setSGR [SetColor Foreground Vivid color]
    putStr str
    setSGR [Reset]

-- message section --
msgY :: Int
msgY = 26

msgX :: Int
msgX = 29

printInvalidButton :: IO ()
printInvalidButton = do    
    setCursorPosition msgY (msgX-2)
    setSGR [SetColor Foreground Vivid Red]
    putStrLn "Invalid button...try again."
    setSGR [Reset]

printPlayerAdv :: String -> IO ()
printPlayerAdv name = do    
    setCursorPosition msgY (msgX-2)
    setSGR [SetColor Foreground Vivid Green]
    putStrLn $ name ++ " gains the advantage."
    setSGR [Reset]

printLostAdvantage :: String -> IO ()
printLostAdvantage name = do
    setCursorPosition msgY msgX
    setSGR [SetColor Foreground Vivid Red]
    putStrLn $ name ++ " loses the advantage."
    setSGR [Reset]

printWrong :: IO ()
printWrong = do    
    setCursorPosition msgY msgX
    setSGR [SetColor Foreground Vivid Red]
    putStrLn "WRONG! Switch it up. \n"
    setSGR [Reset]

printPlayerPointScored :: String -> IO ()
printPlayerPointScored name = do
    setSGR [SetColor Foreground Vivid Green]
    setCursorPosition (msgY-1) (msgX+4)
    putStr "Two in a row!"
    setCursorPosition msgY (msgX-2)    
    putStrLn $ "Point scored for " ++ name ++ "!"
    setSGR [Reset]

printPlayerWins :: String -> IO ()
printPlayerWins name = do    
    setCursorPosition msgY (msgX+4)
    setSGR [SetColor Foreground Vivid Green]
    putStr $ name ++ " Wins!!!\n\n"
    setSGR [Reset]

printDefault :: IO ()
printDefault = do
    setCursorPosition msgY msgX
    putStr "Don't get outplayed!"

-- end of message section --



aX1 :: Int
aX1 = 8

apY1 :: Int
apY1 = 11

printAP1 :: IO ()
printAP1 = do
    setCursorPosition apY1 aX1
    putStrLn " █████  "
    setCursorPosition (apY1+1) aX1
    putStrLn "██   ██"
    setCursorPosition (apY1+2) aX1
    putStrLn "███████" 
    setCursorPosition (apY1+3) aX1
    putStrLn "██   ██"
    setCursorPosition (apY1+4) aX1
    putStrLn "██   ██"

aX2 :: Int
aX2 = 63

aY2 :: Int
aY2 = 11

printAP2 :: IO ()
printAP2 = do
    setCursorPosition aY2 aX2
    putStrLn " █████  "
    setCursorPosition (aY2+1) aX2
    putStrLn "██   ██"
    setCursorPosition (aY2+2) aX2
    putStrLn "███████" 
    setCursorPosition (aY2+3) aX2
    putStrLn "██   ██"
    setCursorPosition (aY2+4) aX2
    putStrLn "██   ██"  


logoX :: Int
logoX = 4

logoY :: Int
logoY = 1

printLogo :: IO ()
printLogo = do
    setCursorPosition logoY logoX
    putStr ".|''''|,            ||            '||`                             ||` "
    setCursorPosition (logoY+1) logoX
    putStr "||    ||            ||             ||                              ||  "
    setCursorPosition (logoY+2) logoX
    putStr "||    || '||  ||` ''||''  '||''|,  ||   '''|.  '||  ||` .|''|, .|''||  "
    setCursorPosition (logoY+3) logoX
    putStr "||    ||  ||  ||    ||     ||  ||  ||  .|''||   `|..||  ||..|| ||  ||  "
    setCursorPosition (logoY+4) logoX
    putStr "`|....|'  `|..'|.   `|..'  ||..|' .||. `|..||.      ||  `|...  `|..||. "
    setCursorPosition (logoY+5) logoX
    putStr "                           ||                    ,  |'       "
    setCursorPosition (logoY+6) logoX
    putStrLn "                          .||                     ''       "

-- not used right now
-- printBG :: IO ()
-- printBG = do
--     setCursorPosition 10 23
--     setSGR [SetColor Background Vivid Yellow]
--     putStrLn " "
--     setSGR [Reset]