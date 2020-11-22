:-include('board.pl').
:-include('game_logic.pl').
:-include('utils.pl').
:-include('ai.pl').
:-include('menus.pl').
:-include('play_game.pl').
:- use_module(library(lists)).
:-use_module(library(system)).

% displays the game
displayGame(GameState, Player):- 
	nth0(0, GameState, Board),
	nth0(1, GameState, BlackCubes),
	nth0(2, GameState, WhiteCubes),
	displayFullBoard(Board),
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

testValidMove:- initialBoard(Board), validMove([0, 0, 0, 4], Board).

testMove:- initialBoard(Board), movePieces(Board, [0, 0, 0, 2], NewBoard), displayBoard(NewBoard, 5), movePieces(NewBoard, [0, 2, 0, 4], NewNewBoard), displayBoard(NewNewBoard, 5).

testMove2:- initialBoard(Board), getMatrixValue(0, 0, Board, SourceCell), getMatrixValue(0, 2, Board, DestCell), printList(SourceCell), nl, printList(DestCell).

testAllMoves:- initialBoard(Board), getAllValidMoves(Board, Moves, w), write('Printing'), nl, printList(Moves).

testGetNumPieces:- intermediateBoard(Board), getNumPiecesOfColorBoard(Board, b, 0, NumPieces), write(NumPieces).

testAllValidMoves:- initialBoard(Board), getAllValidMoves(Board, Moves, w), printListOfList(Moves).

testCountCubes:- finalBoard2(Board), countCubesBoard(bC, Board, 0, NumCubes), write(NumCubes).

testSortMoves:- initialBoard(Board), sortMovesByScore(Board, SortedMoves, w), printList(SortedMoves).

testEvaluate:- initial(GameState), evaluateState(GameState, w, Score), write(Score).

testChooseMove:- initial(GameState), choose_move(GameState, w, 1, Move), printList(Move).

testMoveColor:- initialBoard(Board), isMoveValidColor(w, [2, 0, 0, 1], Board).

testCheckGameOver:- finalBoard1(Board), isGameOver(Board, w).

