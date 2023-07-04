module Instructions where

instructions :: String
instructions = concat 
    [
        "\n\n Welcome to Outplayed! \n\n\n",
        "- This is a game where you try to outwit and outguess your opponent in a head\n to head battle. \n\n",
        "- At the start of each round, both players will pick either 0, 5 or 10.  Don't \nlet your opponent know what you picked! \n\n",
        "- Player 1 will then guess what both of your numbers add up to. (0, 5, 10, 15 \nor 20). \n\n",
        "- If Player 1 correctly guesses the answer, a new round will start and \nPlayer 1 will get to go again. \n\n",
        "- If Player 1 does not guess correctly, a new round will start and Player 2 \nwill guess this time. \n\n",
        "- In order to get a point, you need to win twice in a row. \n\n",
        "- First person to 3 points wins the game. \n\n"
    ]   
    