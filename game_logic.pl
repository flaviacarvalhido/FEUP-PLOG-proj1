:-include('utils.pl').

/*move predicate
move(GameState, Move, NewGameState):- 									%TODO: make this the Move predicate instead of having two predicates
	[X1, Y1, X2, Y2|_] = Move,
	[Board, BlackCubes, WhiteCubes] = GameState,
	[NewBoard, NewBlackCubes, NewWhiteCubes] = NewGameState,			%TODO: NÃO É PRECISO TER NEWCUBES
	getMatrixValue(X1, Y1, Board, SourceCell), 
	getMatrixValue(X2, Y2, Board, DestCell),
	getDistance(X1, Y1, X2, Y2, Distance),
	getFirstNElements(Distance, SourceCell, [], PiecesToMove),
	prepCellSource(SourceCell, Distance, NewSourceCell),
	prepCellDest(DestCell, PiecesToMove, NewDestCell),
	replaceInMatrix(Board, X1, Y1, NewSourceCell, TempBoard),
	replaceInMatrix(TempBoard, X2, Y2, NewDestCell, NewBoard),
	getTopDisc(PiecesToMove, PlayerColor),

	updateCubes(BlackCubes, WhiteCubes, SourceCell, NewSourceCell, DestCell, NewDestCell, PlayerColor),
	replaceInMatrix(Board, X1, Y1, NewSourceCell, NewBoard),			%update board with cube

	NewGameState = [NewBoard, BlackCubes, WhiteCubes].
*/

/*update cubes
updateCubes(BlackCubes, WhiteCubes, SourceCell, NewSourceCell, DestCell, PlayerColor):-
	getTopPiece(NewSourceCell, LeftPiece),
	(LeftPiece=='e', PlayerColor == 'b' -> NewBlackCubes is BlackCubes-1, insertCube(SourceCell, NewSourceCell, b); NewWhiteCubes is WhiteCubes-1, insertCube(SourceCell, NewSourceCell, w)),						
	BlackCubes = NewBlackCubes, WhiteCubes = NewWhiteCubes,

	getTopPiece(DestCell, OverwrittenPiece),
	(OverwrittenPiece=='wC'-> NewWhiteCubes is WhiteCubes+1; NewBlackCubes is BlackCubes+1),
	BlackCubes = NewBlackCubes, WhiteCubes = NewWhiteCubes.
*/



/*ask stack to move*/
askForPiece(Move, Player, Board):-
	selectStack(Coords, Player, Board),
	Move is Coords.

selectStack(Coords, Player, Board):-
	get StackRow asking 'Select the stack you wish to move: Row? ',
	get StackColumn asking 'Column? ',nl,
	Coords = [StackRow, StackColumn],
	checkSelection(StackColumn, StackRow, Player, Board).					/*checking for valid coords and if stack is from the player*/
	
selectStack(Coords, Player, Board):-
	write('Incorrect Selection.'),nl,
	selectStack(Coords, Player, Board).

checkSelection(Column, Row, Player, Board):-
	RowIndex is Row-1,
	ColumnIndex is Column-1,
	validCoords(5, 5, ColumnIndex, RowIndex),
	getMatrixValue(RowIndex, ColumnIndex, Board, Stack),
	checkPlayerColor(Player, Color),
	\+hasNoStacks(Stack, Color).


/*ask for move (input)*/
askForMove(Move, GameState):-										/*TODO: should receive valid moves*/
	get DestRow asking 'Select the position you wish to move to. Row? ',
	get DestColumn asking 'Column? ',nl,
	Coords = [DestRow, DestColumn],
	nth0(0, Move, Row),
	nth0(1, Move, Column),
	nth0(0, GameState, Board),
	Move is [Column, Row, DestColumn, DestRow | _],					/*CAN i DO THIS?*/
	validMove([Column, Row, DestColumn, DestRow | _], Board),!.		/*TODO: instead of this, check if it is in list of valid moves*/

askForMove(Move, GameState):-
	write('Invalid Move.'),nl,
	askForMove(Move, GameState).


/*check if valid move*/
validMove([X1, Y1, X2, Y2|_], Board):- 			/*TODO:tem de haver um predicado que vê as valid moves todas e mete numa lista*/
	(X1 =\= X2; Y1 =\= Y2),
	validCoords(5, 5, X2, Y2),							
	getMatrixValue(X1, Y1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces), !,
	sameRowOrColumn(X1, Y1, X2, Y2),							
	getDistance(X1, Y1, X2, Y2, Distance), !, Distance > 0, Distance < 5, Distance =< NumPieces.


/*isMoveValidColor(Color, [X1, Y1, X2, Y2|_], Board):- getMatrixValue(X1, Y1, Board, Cell), getTopPiece(Cell, Piece), Piece == Color.*/

/*Move predicate*/
movePieces(Board, [X1, Y1, X2, Y2|_], NewBoard):- 	getMatrixValue(X1, Y1, Board, SourceCell), getMatrixValue(X2, Y2, Board, DestCell),
													getDistance(X1, Y1, X2, Y2, Distance),
													getFirstNElements(Distance, SourceCell, [], PiecesToMove),
													prepCellSource(SourceCell, Distance, TempSourceCell),
													prepCellDest(DestCell, PiecesToMove, NewDestCell),
													getTopPiece(SourceCell, TopPiece),
													insertCube(TempSourceCell, NewSourceCell, TopPiece),
													replaceInMatrix(Board, X1, Y1, NewSourceCell, TempBoard),
													replaceInMatrix(TempBoard, X2, Y2, NewDestCell, NewBoard).

move(GameState, Move, NewGameState):- 	nth0(0, GameState, Board),
										movePieces(Board, Move, NewBoard),
										countCubesBoard(b, NewBoard, 0, BlackCubes),
										countCubesBoard(w, NewBoard, 0, WhiteCubes),
										NewGameState = [NewBoard, BlackCubes, WhiteCubes].


/*calculate next player*/
nextPlayer(Player, Next):- Player=='Black', Next='White'.
nextPlayer(Player, Next):- Player=='White', Next='Black'.

/*get player color*/
checkPlayerColor(Player, Color):- Player=='Black', Color='b'.
checkPlayerColor(Player, Color):- Player=='White', Color='w'.

/*winner condition*/
checkWinner(Player, NewGameState):-
	isWinner(Player, NewGameState),
	(Player=='Black'-> write('Black is the winner.'), nl; write('White is the winner.'), nl).

isWinner(Player, NewGameState):- Player=='Black', nth0(1, NewGameState, BlackCubes), BlackCubes==0.
isWinner(Player, NewGameState):- Player=='White', nth0(2, NewGameState, WhiteCubes), WhiteCubes==0.

/*game over condition*/
checkGameOver(Board, Color):-
	isGameOver(Board, Color),
	(Color == 'w' -> write('Black is the winner.'), nl; write('White is the winner.'), nl).
	

isGameOver([], _).

isGameOver([H|T], Color):-
	lineHasNoStacks(H, Color),
	isGameOver(T, Color).



% lineHasNoStacks(Line, Color)
lineHasNoStacks([], _).

lineHasNoStacks([H|T], Color):-
	hasNoStacks(H, Color), !,
	lineHasNoStacks(T, Color).	


hasNoStacks(Stack, Color):-			
	getTopPiece(Stack, Piece), !, 				/*check for cube or disc*/
	\+Piece == Color.	
																									
isDisc(T):- T == 'w'; T == 'b'.

getTopDisc(Stack, Piece):-       
	getTopPiece(Stack, Piece), !,
	isDisc(Piece).


testPrep:- prepCellDest([b, b, b, b, b, b, e, e, e, e, e, e], [w, w, w], NewCell), printList(NewCell).

countCubesBoard(_, [], NumCubesCurrent, NumCubesCurrent).
countCubesBoard(CubeColor, [Head|Tail], NumCubesCurrent, NumCubes):- countCubesRow(CubeColor, Head, 0, NumCubesRow), NumCubesCurrentNew is NumCubesCurrent + NumCubesRow, countCubesBoard(CubeColor, Tail, NumCubesCurrentNew, NumCubes).

countCubesRow(_, [], NumCubesCurrent, NumCubesCurrent).
countCubesRow(CubeColor, [Head|Tail], NumCubesCurrent, NumCubesFinal):- getTopPiece(Head, Piece), Piece == CubeColor, !, NumCubesCurrentNew is NumCubesCurrent+1, countCubesRow(CubeColor, Tail, NumCubesCurrentNew, NumCubesFinal).
countCubesRow(CubeColor, [Head|Tail], NumCubesCurrent, NumCubesFinal):- countCubesRow(CubeColor, Tail, NumCubesCurrent, NumCubesFinal).

prepCellSource(Cell, NumberOfPiecesToMove, NewCell):- 	removeFirstNElements(NumberOfPiecesToMove, Cell, CellAfter),
														refillList(CellAfter, NewCell).

prepCellDest([wC, e, e, e, e, e, e, e, e, e, e, e], PiecesToAdd, NewCell):- Cell = [e, e, e, e, e, e, e, e, e, e, e, e], append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).
prepCellDest([bC, e, e, e, e, e, e, e, e, e, e, e], PiecesToAdd, NewCell):- Cell = [e, e, e, e, e, e, e, e, e, e, e, e], append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).
prepCellDest(Cell, PiecesToAdd, NewCell):- append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).

insertCube(Cell, NewCell, w):- Cell == [e, e, e, e, e, e, e, e, e, e, e, e], !, NewCell = [wC, e, e, e, e, e, e, e, e, e, e, e].
insertCube(Cell, Cell, w).
insertCube(Cell, NewCell, b):- Cell == [e, e, e, e, e, e, e, e, e, e, e, e], !, NewCell = [bC, e, e, e, e, e, e, e, e, e, e, e].
insertCube(Cell, Cell, b).

movePieces(Board, [X1, Y1, X2, Y2|_], NewBoard):- 	getMatrixValue(X1, Y1, Board, SourceCell), getMatrixValue(X2, Y2, Board, DestCell),
													getDistance(X1, Y1, X2, Y2, Distance),
													getFirstNElements(Distance, SourceCell, [], PiecesToMove),
													prepCellSource(SourceCell, Distance, TempSourceCell),
													prepCellDest(DestCell, PiecesToMove, NewDestCell),
													getTopPiece(SourceCell, TopPiece),
													insertCube(TempSourceCell, NewSourceCell, TopPiece),
													replaceInMatrix(Board, X1, Y1, NewSourceCell, TempBoard),
													replaceInMatrix(TempBoard, X2, Y2, NewDestCell, NewBoard).

move(GameState, Move, NewGameState):- 	nth0(0, GameState, Board),
										movePieces(Board, Move, NewBoard),
										countCubesBoard(bC, NewBoard, 0, BlackCubes),
										countCubesBoard(wC, NewBoard, 0, WhiteCubes),
										ActualBlackCubes is 9 - BlackCubes,
										ActualWhiteCubes is 9 - WhiteCubes,
										NewGameState = [NewBoard, ActualBlackCubes, ActualWhiteCubes].

