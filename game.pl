:-include('board.pl').


displayGame(GameState, Player):- displayBoard(GameState), write(Player), write(' is up next.').

play:- initialBoard(GameState), displayGame(GameState, 'player1').