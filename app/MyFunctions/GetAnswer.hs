module MyFunctions.GetAnswer where

import Data
    ( Game(gMessage), MsgType(Invalid, Default), Player(Player1) )
import System.IO
    ( hSetBuffering, hSetEcho, stdin, BufferMode(NoBuffering) )
import System.Console.ANSI (clearScreen, Color (Magenta, Cyan), setCursorPosition)
import MyFunctions.MyPrintf ( printColorName )
import MyFunctions.Scoreboard (scoreboard)
import Control.Monad.Cont (MonadIO(liftIO))
import MyFunctions.Rendering (renderScene)
import Control.Monad.State ( StateT, modify, MonadIO(liftIO) )

getAnswer :: String -> String -> Player -> StateT Game IO String
getAnswer p1Name p2Name who = do
    liftIO $ do 
        hSetBuffering stdin NoBuffering
        hSetEcho stdin False
    renderScene
    if who == Player1
    then do
        liftIO $ do 
            setCursorPosition 29 6
            printColorName Magenta p1Name
            setCursorPosition 30 6
            putStrLn "Choose 0 / 5 / 10 / 15 / 20 "
            setCursorPosition 31 6
            putStrLn "use....q / w / e /  r  /  t "
        guess <- liftIO getChar
        modify (\m -> m{gMessage = Default})
        case guess of
            'q' -> return "0"
            'w' -> return "5"
            'e' -> return "10"
            'r' -> return "15"
            't' -> return "20"
            _   -> do
                modify (\m -> m{gMessage = Invalid})
                getAnswer p1Name p2Name who
    else do
        liftIO $ do 
            setCursorPosition 29 45
            printColorName Cyan p2Name
            setCursorPosition 30 45
            putStrLn "Choose 0 / 5 / 10 / 15 / 20 "
            setCursorPosition 31 45
            putStrLn "use....y / u / i /  o  /  p "
        guess <- liftIO getChar
        modify (\m -> m{gMessage = Default})
        case guess of
            'y' -> return "0"
            'u' -> return "5"
            'i' -> return "10"
            'o' -> return "15"
            'p' -> return "20"
            _ -> do
                modify (\m -> m{gMessage = Invalid})
                getAnswer p1Name p2Name who