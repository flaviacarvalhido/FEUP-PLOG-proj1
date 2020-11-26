:-include('board.pl').
:-include('game_logic.pl').
:-include('utils.pl').
:-include('ai.pl').
:-include('menus.pl').
:-include('play_game.pl').
:- use_module(library(lists)).
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
	displayFullBoard(Board),
	write(Player), write(' is up next.'),
	nl,
	write('Black has '), write(BlackCubes), write(' cubes available to play.'),
	nl,
	write('White has '), write(WhiteCubes), write(' cubes available to play.'), nl.


% starting point predicate
play:- 	mainMenu ; true.

% Tests

testInput:- testBoard(Board), GameState = [Board, 9, 9], displayGame(GameState, 'Black'), askForPlayerInput(Move, 'Black', GameState).

testGet:- testBoard(Board), displayBoard(Board, 5), checkSelection(0, 4, 'Black', Board).

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

testMoves:- testBoard(Board), GameState=[Board, 4, 4], displayGame(GameState, 'White'), move(GameState, [4, 3, 4, 4], NewGameState), displayGame(NewGameState, 'Black').


% validMove([4, 2, 4, 1], Board), isMoveValidColor(b, [4, 2, 4, 1], Board).

