:-include('board.pl').
:- use_module(library(lists)).

% displays the game
displayGame(GameState, Player):- nth0(0, GameState, Board),
								nth0(1, GameState, BlackCubes),
								nth0(2, GameState, WhiteCubes),
								displayBoard(Board),
								write(Player), write(' is up next.'),
								nl,
								write('Black has '), write(BlackCubes), write(' cubes available to play.'),
								nl,
								write('White has '), write(WhiteCubes), write(' cubes available to play.').

% starting point predicate
play:- initial(GameState), displayGame(GameState, 'player1').
