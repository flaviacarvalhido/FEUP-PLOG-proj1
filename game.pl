:-include('board.pl').
:-include('game_logic.pl').
:-include('utils.pl').
:-include('ai.pl').
:- use_module(library(lists)).

% displays the game
displayGame(GameState, Player):- 
	nth0(0, GameState, Board),
	nth0(1, GameState, BlackCubes),
	nth0(2, GameState, WhiteCubes),
	displayBoard(Board, 5),
	write(Player), write(' is up next.'),
	nl,
	write('Black has '), write(BlackCubes), write(' cubes available to play.'),
	nl,
	write('White has '), write(WhiteCubes), write(' cubes available to play.').


% starting point predicate
play:- 	initial(GameState), play(GameState, 'Black').

play(GameState, Player):-
	displayGame(GameState, Player),
	[Board, BlackCubes, WhiteCubes] = GameState,
	
	askForPiece(Move, Player, Board),
	/*TODO:check all valid moves*/
	/*TODO:ask for move (and check if it is in validMoves list)*/
	/*TODO:make Move a list with [currentCoordinates, newCoordinates]*/
	move(GameState, Move, NewGameState),							/*Move -> 0:Row, 1:Column*/
	[NewBoard, NewBlackCubes, NewWhiteCubes] = NewGameState,

	checkPlayerColor(Player, Color),

	\+checkGameOver(NewBoard, Color),				%this exits loop when game is over, goes to play again
	\+checkWinner(Player, NewGameState),		


	nextPlayer(Player, Next),
	play(NewGameState, Next).


play(GameState, Player):-
	/*play again*/
	get 'Y' asking 'Game ended. Do you wish to play again? (Y/N)',
	play.

testValidMove:- initialBoard(Board), validMove([0, 0, 1, 0], Board, w).

testMove:- initialBoard(Board), movePieces(Board, [0, 0, 0, 2], NewBoard), displayBoard(NewBoard, 5).

testMove2:- initialBoard(Board), getMatrixValue(0, 0, Board, SourceCell), getMatrixValue(0, 2, Board, DestCell), printList(SourceCell), nl, printList(DestCell).

testAllMoves:- initialBoard(Board), getAllValidMoves(Board, Moves, w), write('Printing'), nl, printList(Moves).

testGetNumPieces:- intermediateBoard(Board), getNumPiecesOfColorBoard(Board, b, 0, NumPieces), write(NumPieces).

