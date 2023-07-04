module MyFunctions.Rendering where

import System.Console.ANSI
    ( clearScreen,
      setCursorPosition,
      setSGR,
      Color(Black),
      ColorIntensity(Vivid),
      ConsoleLayer(Foreground),
      SGR(Reset, SetColor) )
import MyFunctions.Scoreboard (scoreboard)
import Control.Monad.State ( forM_, gets, MonadIO(liftIO), StateT )
import Data
    ( Game(gWhosTurn, gP1Name, gP2Name, gMessage),
      MsgType(..),
      Player(Player1) )
import MyFunctions.MyPrintf
    ( printDefault,
      printInvalidButton,
      printLogo,
      printLostAdvantage,
      printPlayerAdv,
      printPlayerPointScored,
      printPlayerWins,
      printWrong )
import MyFunctions.DisplayGuesses (displayGuesses)


renderSlot :: Char -> (Int, Int) -> IO ()
renderSlot char (x,y) = do
    setCursorPosition x y
    setSGR [SetColor Foreground Vivid Black]
    putChar char
    setSGR [Reset]

height :: Int
height = 33

width :: Int
width = 77

middle :: Int
middle = (width + 1) `div` 2

renderBorder :: IO ()
renderBorder = do
    forM_ [0..height] $ \y -> do
        forM_ [0..width] $ \x -> do
            if x == 0 || y == 0 || y == height || x == width
            then do
                renderSlot 'X' (y,x) 
            else do
                renderSlot ' ' (y,x) 

scoreBoardBorder :: IO ()
scoreBoardBorder = do
    --sides
    forM_ [8..17] $ \y -> do
        renderSlot 'X' (y, 22)
        renderSlot 'X' (y, 56)
    --top/bottom
    forM_ [22..56] $ \x -> do
        renderSlot 'X' (17, x)

renderLogoBorder :: IO () 
renderLogoBorder = do
    forM_ [0..width] $ \x -> do
        renderSlot 'X' (8, x) 

renderGuessBorder :: IO () 
renderGuessBorder = do
    forM_ [0..width] $ \x -> do
        renderSlot 'X' (27, x) 

renderCenterLine :: IO ()
renderCenterLine = do
    forM_ [9..12] $ \y -> do
        forM_ [0..width] $ \x -> do
            if x == middle
            then do 
                renderSlot 'X' (y,x)
            else do
                putStr ""
    forM_ [14..16] $ \y -> do
        forM_ [0..width] $ \x -> do
            if x == middle
            then do 
                renderSlot 'X' (y,x)
            else do
                putStr ""
    forM_ [27..height] $ \y -> do
        forM_ [0..width] $ \x -> do
            if x == middle
            then do 
                renderSlot 'X' (y,x)
            else do
                putStr ""
    
renderMessage :: MsgType -> StateT Game IO ()
renderMessage message = do
    who    <- gets gWhosTurn
    p1name <- gets gP1Name
    p2name <- gets gP2Name
    if who == Player1
    then do
        case message of
            Advantage     -> liftIO $ printPlayerAdv p1name
            LostAdvantage -> liftIO $ printLostAdvantage p2name
            Point         -> liftIO $ printPlayerPointScored p1name
            Win           -> liftIO $ printPlayerWins p1name
            Invalid       -> liftIO printInvalidButton
            Wrong         -> liftIO printWrong
            Default       -> liftIO printDefault
    else do
        case message of
            Advantage     -> liftIO $ printPlayerAdv p2name
            LostAdvantage -> liftIO $ printLostAdvantage p1name
            Point         -> liftIO $ printPlayerPointScored p2name
            Win           -> liftIO $ printPlayerWins p2name
            Invalid       -> liftIO printInvalidButton
            Wrong         -> liftIO printWrong
            Default       -> liftIO printDefault

renderPickedNumberLabel :: IO ()
renderPickedNumberLabel = do
    setCursorPosition 18 5
    putStr "Number picked"
    setCursorPosition 18 61
    putStr "Number picked"

renderScene :: StateT Game IO ()
renderScene = do
    liftIO $ do 
        clearScreen
        renderBorder
        scoreBoardBorder    
        printLogo
        renderCenterLine
        renderGuessBorder
        renderLogoBorder
        renderPickedNumberLabel
    scoreboard
    displayGuesses
    msg <- gets gMessage
    renderMessage msg