module MyFunctions.GetNumber where

import Data
    ( Game(gP1Name, gP2Name, gWhosTurn, gMessage),
      MsgType(Invalid, Default),
      Player(Player1) )
import Control.Monad.State
    ( StateT, gets, modify, MonadIO(liftIO) )
import System.IO
    ( hSetBuffering, hSetEcho, stdin, BufferMode(NoBuffering) )
import System.Console.ANSI
    ( Color(Cyan, Magenta), clearScreen, setCursorPosition )
import MyFunctions.MyPrintf ( printColorName )
import MyFunctions.Rendering (renderScene)

getNumber :: Player -> StateT Game IO String
getNumber p = do
    p1Name   <- gets gP1Name
    p2Name   <- gets gP2Name
    whosTurn <- gets gWhosTurn
    
    liftIO clearScreen
    renderScene
    
    if p == Player1
    then do
        liftIO $ do 
            setCursorPosition 29 10
            printColorName Magenta p1Name
            setCursorPosition 30 10
            putStrLn "Choose 0 / 5 / 10"
            setCursorPosition 31 10
            putStrLn "use....q / w / e"
            hSetBuffering stdin NoBuffering
            hSetEcho stdin False
        guess <- liftIO getChar
        liftIO clearScreen
        modify (\m -> m{gMessage = Default})

        case guess of
            'q' -> return "0"
            'w' -> return "5"
            'e' -> return "10"
            _ -> do
                 modify (\m -> m{gMessage = Invalid})
                 getNumber p
    else do
        liftIO $ do
            setCursorPosition 29 50
            printColorName Cyan p2Name
            setCursorPosition 30 50
            putStrLn "Choose 0 / 5 / 10"
            setCursorPosition 31 50
            putStrLn "use....y / u / i"
            hSetBuffering stdin NoBuffering
        guess <- liftIO getChar
        liftIO clearScreen
        modify (\m -> m{gMessage = Default})
        case guess of
            'y' -> return "0"
            'u' -> return "5"
            'i' -> return "10"
            _ -> do 
                modify (\m -> m{gMessage = Invalid})
                getNumber p