:-include('gameplay/play_game.pl').
:-use_module(library(lists)).
:-use_module(library(system)).

/* displayGame(+GameState, +Player)
 *
 * Displays the received GameState
 *
 */
displayGame(GameState, Player):- 
	nth0(0, GameState, Board),
	nth0(1, GameState, BlackCubes),
	nth0(2, GameState, WhiteCubes),
	displayFullBoardAlt(Board),
	write(Player), write(' is up next.'), nl,
	write('Black has '), write(BlackCubes), write(' cubes available to play.'), nl,
	write('White has '), write(WhiteCubes), write(' cubes available to play.'), nl.


% starting point predicate
play:- 	mainMenu ; true.
