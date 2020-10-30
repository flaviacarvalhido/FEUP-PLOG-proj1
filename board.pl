

% initial/1 - generates the initial state of the game
initial(GameState):- initialBoard(Board),
						BlackCubes = 9,
						WhiteCubes = 9,
						GameState = [Board,blackCubes,whiteCubes].

% initialBoard/1 - generates the initial board
initialBoard([
			[[w,w,w,w,w,w,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
			[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,b,b,b,e,e,e,e,e,e]]
			]).

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
% finalBoard1/1 - generates an example of a finished game
finalBoard1(		[
					[[e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,b,b,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[bC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,b,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]]
					]).
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
% finalBoard2/1 - generates an example of a finished game
finalBoard2(		[
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [w,b,w,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[bC,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e], [b,w,e,e,e,e,e,e,e,e,e,e], [w,b,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
					]).

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

% finalBoard2/1 - generates an example of an intermediate game state
intermediateBoard(	[
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [b,b,b,w,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[w,e,e,e,e,e,e,e,e,e,e,e], [wC,e,e,e,e,e,e,e,e,e,e,e], [b,w,b,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e], [e,e,e,e,e,e,e,e,e,e,e,e]],
					[[wC,e,e,e,e,e,e,e,e,e,e,e], [w,w,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [bC,e,e,e,e,e,e,e,e,e,e,e], [b,e,e,e,e,e,e,e,e,e,e,e]]
					]).

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


% displayBoard/1 - displays the board
displayBoard([]).
displayBoard([L|[]]):- displayLine(L), nl.
displayBoard([L|T]):- displayLine(L), nl, displayIntermediateLine, nl, displayIntermediateLine, nl, displayBoard(T).

% displayIntermediateLine/1 - displays a line for the board aesthetics
displayIntermediateLine:- write('            |                         |                           |                           |                           |            ').

% displayLine/1 - displays a line of the board
displayLine([]).
displayLine([C|[]]):- displayCell(C).
displayLine([C|L]):- displayCell(C),write(' -- '), displayLine(L).

% displayCell/1 - displays a cell of the board
displayCell([]).
displayCell([P|R]):- displayPiece(P), displayCell(R).

% displayPiece/1 - displays a piece
displayPiece(C):- getCode(C, Code),write(Code).


generateInitialBoard(FinalBoard, FinalBoard, _, _, 0):- !.
generateInitialBoard(Board, FinalBoard, Npieces, Ncols, N):- N > 0,
														N1 is N-1,
														generateRow([], FinalFinal, Nrows, N, Ncols, Npieces, Ncols),
														generateInitialBoard([FinalFinal|Board], FinalBoard, Npieces, Ncols, N1).


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


generateBoardCell(0, _, FinalCell, FinalCell):- !.
generateBoardCell(NumberOfPieces, Type, Cell, FinalCell):-	NumberOfPieces > 0,
															NumberOfPiecesNew is NumberOfPieces-1,
															(
																NumberOfPieces > 6 -> ActualType = e; ActualType = Type
															),
															generateBoardCell(NumberOfPiecesNew, Type, [ActualType|Cell], FinalCell).


testDisplay:- generateRow([], FinalFinal, 5, 5), displayLine(FinalFinal).
/*testDisplay:- generateBoardRow(6, 6, [], FinalBoard), displayLine(FinalBoard).*/
testDisplayFull:- generateInitialBoard([], FinalBoard, 10, 5, 5), displayBoard(FinalBoard).
testDisplayIntermediate:- intermediateBoard(Board), displayBoard(Board).


getCode(b, 'O ').
getCode(w, 'X ').
getCode(bC, 'I ').
getCode(wC, '& ').
getCode(e, '  ').