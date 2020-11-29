:- include('../other/utils.pl').

% generates the initial state of the game
initial(GameState):- initialBoard(Board),
						BlackCubes = 9,
						WhiteCubes = 9,
						GameState = [Board,BlackCubes,WhiteCubes].

% generates the initial board
initialBoard([
			[[w,w,w,w,w,w,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,b,b,b,e,e,e,e,e,e]]
			]).

initialBoardAlt([
			[[w,w,w,w,w,w], [], [], [], []],
			[[], [], [], [], []],
			[[], [], [], [], []],
			[[], [], [], [], []],
			[[], [], [], [], [b, b, b, b, b, b]]
			]).

% Hardcoded initial state
initialState(
[
	[
		[[w,w,w,w,w,w,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,b,b,b,e,e,e,e,e,e]]
	], 
	9,
	9
]
).


% Black loses because he doesnt have any moveable piece
% generates an example of an end game board
finalBoard1(		[
					[[e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,b,b,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[bC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,b,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]]
					]).

% example of an end game state
finalState1(
[
	[
		[[e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,b,b,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[bC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[w,b,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]]
	],
	6,
	7
]
).

% Black wins because he has placed all his cubes
% generates an example of a finished game
finalBoard2(		[
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,w,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [b,w,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
					]).

% example of an end game state
finalState2(
[
	[
		[[wC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,w,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
		[[bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
		[[w,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [b,w,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
	],
	0,
	6
]
).

% generates an example of an intermediate game state
intermediateBoard(	[
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,w,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [b,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,w,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
					]).

% example of an intermediate game state
intermediateState(
[
	[
		[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,w,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[w,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [b,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
		[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,w,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
	],
	7,
	5
]
).

/*
 *
 *	Helper predicates for board aesthethics
 *
 */
displayCoordsHorizontal:-	write('|      0      |      1      |      2      |      3      |      4      |'), nl.
displayBorderHorizontalAlt:-	write('|_____________________________________________________________________|___'), nl.
displayIntermediateLineEmptyAlt:-	write('|             |             |             |             |             |'), nl.
displayIntermediateLineAlt:-	write('|---------------------------------------------------------------------|---'), nl.

/*
 * displayFullBoardAlt(+Board)
 *	
 * Displays the full board with the top frame.
 *
 */
displayFullBoardAlt(Board):- displayCoordsHorizontal, displayBorderHorizontalAlt, displayBoardAlt(Board, 0), displayBorderHorizontalAlt.

/*
 * displayBoardAlt(+Board, +N)
 *	
 * Displays the board.
 *
 */
displayBoardAlt([], _).
displayBoardAlt([BoardHead|BoardTail], 4):-	displayIntermediateLineEmptyAlt, displayRowAlt(BoardHead, 0, 5, 4), nl, displayRowAlt(BoardHead, 1, 5, 0), nl, displayIntermediateLineEmptyAlt, displayBoardAlt(BoardTail, N1).
displayBoardAlt([BoardHead|BoardTail], N):-	N1 is N+1, displayIntermediateLineEmptyAlt, displayRowAlt(BoardHead, 0, 5, N), nl, displayRowAlt(BoardHead, 1, 5, N), nl, displayIntermediateLineEmptyAlt, displayIntermediateLineAlt, displayBoardAlt(BoardTail, N1).

/*
 * displayRowAlt(+Row, +Flag, +N, +NRow)
 *	
 * Displays a row of the board. Flag tells the predicate whether to display the bottom part of the stack or the top part.
 * N is the number of the cell to be displayed and NRow is the number of the current row.
 *
 */
displayRowAlt([], 0, _, NRow):- displayBorderVertical, write(' '), write(NRow).
displayRowAlt([], _, _, _):- displayBorderVertical.
displayRowAlt([RowHead|RowTail], 0, 5, NRow):-	displayBorderVertical, displayCellAlt(RowHead, 0), displayBorderVertical, displayRowAlt(RowTail, 0, 4, NRow).
displayRowAlt([RowHead|RowTail], 0, 1, NRow):-	displayCellAlt(RowHead, 0), displayRowAlt(RowTail, 0, 4, NRow).
displayRowAlt([RowHead|RowTail], 0, N, NRow):-	N1 is N-1, displayCellAlt(RowHead, 0), displayBorderVertical, displayRowAlt(RowTail, 0, N1, NRow).
displayRowAlt([RowHead|RowTail], 1, 5, NRow):-	displayBorderVertical, displayCellAlt(RowHead, 1), displayBorderVertical, displayRowAlt(RowTail, 1, 4, NRow).
displayRowAlt([RowHead|RowTail], 1, 1, NRow):-	displayCellAlt(RowHead, 1), displayRowAlt(RowTail, 1, 4, NRow).
displayRowAlt([RowHead|RowTail], 1, N, NRow):-	N1 is N-1, displayCellAlt(RowHead, 1), displayBorderVertical, displayRowAlt(RowTail, 1, N1, NRow).

/*
 * displayCellAlt(+Cell, +Flag)
 *	
 * Displays a cell of the board. Flag tells the predicate whether to show the bottom part of the cell or the top part.
 *
 */
displayCellAlt([], _).
displayCellAlt(Cell, 0):-	getFirstNElements(6, Cell, [], Elements), write(' '), displayCell(Elements).
displayCellAlt(Cell, 1):-	removeFirstNElements(6, Cell, NewCell), write(' '), displayCell(NewCell).

/*
 * displayFullBoard(+Board)
 *	
 * Displays the full board with the top frame.
 *
 */
displayFullBoard(Board):- write('|            0                         1                           2                           3                           4             |'), nl, displayBoard(Board, 0).

/*
 * displayBoard(+Board, +N)
 *	
 * Displays the board.
 *
 */
displayBoard([], _).
displayBoard([L|[]], N):- displayLine(L, 5, N), displayBorderHorizontal, nl.
displayBoard([L|T], N):- N =:= 0, !, N1 is N+1, displayBorderHorizontal, nl, displayIntermediateLineEmpty, nl, displayLine(L, 5, N), displayIntermediateLineEmpty, nl, displayIntermediateLine, nl, displayIntermediateLine, nl, displayIntermediateLineEmpty, nl, displayBoard(T, N1).
displayBoard([L|T], N):- N1 is N+1, displayIntermediateLineEmpty, nl, displayLine(L, 5, N), displayIntermediateLine, nl, displayIntermediateLine, nl, displayIntermediateLineEmpty, nl, displayBoard(T, N1).

/*
 *
 *	Helper predicates for board aesthethics
 *
 */
displayIntermediateLineEmpty:- write('|                                                                                                                                        |').
displayIntermediateLine:- write('|            |                         |                           |                           |                           |             |').
displayBorderHorizontal:- write(' ________________________________________________________________________________________________________________________________________').
displayBorderVertical:- write('|').

/*
 * displayLine(+Line, +N, +Nrow)
 *	
 * Displays a row of the board.
 * N is the number of the cell to be displayed and Nrow is the number of the current row.
 *
 */
displayLine([], _, _).
displayLine([C|[]], _, Nrow):- displayCell(C), displayBorderVertical, write(' '), write(Nrow), nl.
displayLine([C|L], N, Nrow):- N =:= 5, !, N1 is N-1, displayBorderVertical, displayCell(C), write(' -- '), displayLine(L, N1, Nrow).
displayLine([C|L], N, Nrow):- N1 is N-1, displayCell(C), write(' -- '), displayLine(L, N1, Nrow).

/*
 * displayCell(+Cell)
 *	
 * Displays a cell of the board.
 *
 */
displayCell([]).
displayCell([P|R]):- displayPiece(P), displayCell(R).

/*
 * displayPiece(+C)
 *	
 * Displays a piece.
 *
 */
displayPiece(C):- getCode(C, Code),write(Code).

% generates a board with Npieces pieces per cell, Ncols columns and N rows
generateInitialBoard(FinalBoard, FinalBoard, _, _, 0):- !.
generateInitialBoard(Board, FinalBoard, Npieces, Ncols, N):- N > 0,
														N1 is N-1,
														generateRow([], FinalFinal, _, N, Ncols, Npieces, Ncols),
														generateInitialBoard([FinalFinal|Board], FinalBoard, Npieces, Ncols, N1).

% generates a board row with Ncols cells
generateRow(FinalFinal, FinalFinal, _, _, _, _, 0):- !.
generateRow(FinalRow, FinalFinal, Nrows, CurrentRow, Ncols, Npieces, 1):-
							(
								CurrentRow =:= 1 -> Type = w; Type = e
							),
							generateBoardCell(Npieces, Type, [], FinalCell),
							generateRow([FinalCell|FinalRow], FinalFinal, Nrows, CurrentRow, Ncols, Npieces, 0).
generateRow(FinalRow, FinalFinal, Nrows, CurrentRow, Ncols, Npieces, N):- 
							N > 0,
							(
								N =:= Ncols, CurrentRow =:= Ncols -> Type = b; Type = e
							),
							N1 is N-1,
							generateBoardCell(Npieces, Type, [], FinalCell),
							generateRow([FinalCell|FinalRow], FinalFinal, Nrows, CurrentRow, Ncols, Npieces, N1).

% generates a board cell with Npieces spaces
generateBoardCell(0, _, FinalCell, FinalCell):- !.
generateBoardCell(NumberOfPieces, Type, Cell, FinalCell):-	NumberOfPieces > 0,
															NumberOfPiecesNew is NumberOfPieces-1,
															(
																NumberOfPieces > 6 -> ActualType = e; ActualType = Type
															),
															generateBoardCell(NumberOfPiecesNew, Type, [ActualType|Cell], FinalCell).

% atom to character translation
getCode(b, 'O ').
getCode(w, 'X ').
getCode(bC, 'I ').
getCode(wC, '& ').
getCode(e, '  ').