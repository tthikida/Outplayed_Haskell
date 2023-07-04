module Setup where

import System.Console.ANSI ( clearScreen, getTerminalSize ) 
import Instructions ( instructions )
import Control.Monad.State ( modify, MonadIO(liftIO), StateT, gets )
import Data ( Game(gP1Name, gP2Name) )
import System.IO (hSetBuffering, stdin, BufferMode (NoBuffering, LineBuffering), hSetEcho)
-- import GHC.IO.Buffer (Buffer(Buffer))
import MyFunctions.InitializeGame ( initializeGame )
import System.Console.Terminal.Size ()
import Data.Maybe ()

-- Check Terminal Size
-- Get Names
-- Ask for instructions
-- Initialize game

setup :: StateT Game IO ()
setup = do 
    liftIO $ do 
        hSetBuffering stdin LineBuffering
        hSetEcho stdin True
        clearScreen

-- Check Terminal Size --
    screenSize <-liftIO getTerminalSize
    if screenSize < Just (34,78)
    then do
        liftIO $ do 
            putStrLn "Screen is not big enough.  Adjust screen then press Enter."
            putStrLn $ "Current size: " ++ show screenSize
            putStrLn " Needed size: Just (34,78)"
        _ <- liftIO getChar
        liftIO $ putStrLn "Dummy Line"
    else do

-- Get Names --    
        p1Name <- gets gP1Name
        p2Name <- gets gP2Name
        if p1Name == "Player 1" || p2Name == "Player 2"
        then do
            liftIO $ do 
                clearScreen
                putStrLn "*********Outplayed*********\n"
                putStrLn "Enter first player name"
            firstPlayerName <- liftIO getLine
            modify (\p -> p {gP1Name = firstPlayerName})

            liftIO $ do 
                clearScreen
                putStrLn "Enter second player name"
            secondPlayerName <- liftIO getLine
            modify (\p -> p {gP2Name = secondPlayerName})

-- Ask for instructions --            
            liftIO $ do 
                clearScreen
                putStr $ concat ["\nHello ", firstPlayerName, " and ", secondPlayerName, "!\n\n"]
                putStr "Would you like to read the instructions? (Enter y or n)\n"
            yOrN <- liftIO getLine
            liftIO clearScreen
            
            if yOrN == "y" || yOrN == "Y" 
                then do 
                    liftIO $ do 
                        putStrLn instructions 
                        putStrLn "Press Enter to continue"
                    _ <- liftIO getLine
-- Initialize game --
                    liftIO $ do
                        clearScreen
                        putStrLn "Let the games begin!"
                        putStrLn "Press Enter to start."
                    _ <- liftIO getChar
                    liftIO clearScreen
                    initializeGame
                else do
                    liftIO $ do
                        clearScreen
                        putStrLn "Let the games begin!"
                        putStrLn "Press Enter to start."
                        _ <- liftIO getChar
                        liftIO clearScreen
                    initializeGame
        else do
            initializeGame