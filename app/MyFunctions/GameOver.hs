module MyFunctions.GameOver where

gameOver :: IO ()
gameOver = do
        putStrLn " #####     #    #     # #######    ####### #     # ####### ######  "
        putStrLn "#     #   # #   ##   ## #          #     # #     # #       #     # "
        putStrLn "#        #   #  # # # # #          #     # #     # #       #     # "
        putStrLn "#  #### #     # #  #  # #####      #     # #     # #####   ######  "
        putStrLn "#     # ####### #     # #          #     #  #   #  #       #   #   "
        putStrLn "#     # #     # #     # #          #     #   # #   #       #    #  "
        putStrLn " #####  #     # #     # #######    #######    #    ####### #     # "