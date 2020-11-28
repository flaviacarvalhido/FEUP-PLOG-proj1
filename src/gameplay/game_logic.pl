:- use_module(library(lists)).
:- include('../other/utils.pl').
:- include('../display/menus.pl').

/*
 * validCoords(+Nrows, +Ncols, +X, +Y)
 *
 * Succeeds if X in in the interval [0, Nrows[ and Y in the interval [0, Ncols[, fails otherwise
 *
 */
validCoords(Nrows, Ncols, X, Y):- X < Ncols, X >= 0, Y < Nrows, Y >= 0.

/*
 * sameRowOrColumn(+X1, +Y1, +X2, +Y2)
 *
 * Succeeds if coordinates (X1, Y1) and (X2, Y2) are in the same row or column of the board
 *
 */
sameRowOrColumn(X1, Y1, X2, Y2):- X1 =:= X2; Y1 =:= Y2.

/*
 * askForPiece(-Move, +Player, +Board)
 *
 * Asks the player for input regarding the stack he wishes to move and validates it. The validated input is returned in Move.
 *
 */
askForPiece(Move, Player, Board):-
	selectStack(Coords, Player, Board),
	Move = Coords.

/*
 * selectStack(-Coords, +Player, +Board)
 *
 * Asks the player for input regarding the stack he wishes to move and validates it. The position of the selected stack is returned in Coords.
 *
 */
selectStack(Coords, Player, Board):-
	get StackRow asking 'Select the stack you wish to move: X? ',
	get StackColumn asking 'Y? ', nl, !,
	Coords = [StackColumn, StackRow],
	checkSelection(StackColumn, StackRow, Player, Board).
selectStack(Coords, Player, Board):-
	write('Incorrect Selection.'), nl,
	selectStack(Coords, Player, Board).

/*
 * checkSelection(+Column, +Row, +Player, +Board)
 *
 * Succeeds if the coordinates (Column, Row) represent a valid stack for the player Player.
 *
 */
checkSelection(Column, Row, Player, Board):-
	validCoords(5, 5, Column, Row),
	getMatrixValue(Column, Row, Board, Stack), !,
	checkPlayerColor(Player, Color),
	\+hasNoStacks(Stack, Color).

/*
 * askForPlayerInput(-Move, +Player, +GameState)
 *
 * Asks the player for input regarding the stack he wishes to move and the position he wants to move it to and validates both. The move inserted by the player is returned in Move.
 *
 */
askForPlayerInput(Move, Player, GameState):-	nth0(0, GameState, Board),
												askForPiece(SourcePos, Player, Board),
												!, askForMove(SourcePos, GameState, Move), !, write(Move).

/*
 * askForMove(+InitialPos, +GameState, -Move)
 *
 * Asks the player for input regarding where he wants to move the previously selected stack to. The selected position is returned in Move.
 *
 */
askForMove(InitialPos, GameState, Move):-
	get DestRow asking 'Select the position you wish to move to. X? ',
	get DestColumn asking 'Y? ', nl,
	Coords = [DestColumn, DestRow],
	nth0(0, GameState, Board),
	append(InitialPos, Coords, Move),
	write(Move), nl, !,
	validMove(Move, Board).
askForMove(InitialPos, GameState, Move):-
	write('Invalid Move.'), nl,
	askForMove(InitialPos, GameState, Move).

/*
 * validMove(+Move, +Board)
 *
 * Succeeds if Move represents a valid move for any player in the current board Board.
 *
 */
validMove([X1, Y1, X2, Y2|_], Board):-
	(X1 =\= X2; Y1 =\= Y2),
	validCoords(5, 5, X1, Y1),
	validCoords(5, 5, X2, Y2),							
	getMatrixValue(X1, Y1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces), !,
	sameRowOrColumn(X1, Y1, X2, Y2),							
	getDistance(X1, Y1, X2, Y2, Distance), !, Distance > 0, Distance < 5, Distance =< NumPieces.

/*
 * isMoveValidColor(+Color, +Move, +Board)
 *
 * Succeeds if Move represents a valid move for the player playing with color Color in the current board Board.
 *
 */
isMoveValidColor(Color, [X1, Y1, _, _ |_], Board):- getMatrixValue(X1, Y1, Board, Cell), getTopPiece(Cell, Piece), !, Piece == Color.

/*
 * checkPlayerColor(+Player, -Color)
 *
 * Given the player's name ('Black' or 'White'), returns the atom corresponding to its color
 *
 */
checkPlayerColor(Player, Color):- Player=='Black', Color='b'.
checkPlayerColor(Player, Color):- Player=='White', Color='w'.

/*
 * checkWinner(+Player, +GameState)
 *
 * Succeeds if one the player Player wins by placing all his cubes and displays the game over message.
 *
 */
checkWinner(Player, GameState):-
	isWinner(Player, GameState), !,
	(Player=='Black'-> (sleep(1), clearConsole, displayGameOverMessageBlack, sleep(2), nl); (sleep(1), clearConsole, displayGameOverMessageWhite, sleep(2), nl)).

/*
 * isWinner(+Player, +GameState)
 *
 * Succeeds if player Player wins by placing all his cubes.
 *
 */
isWinner(Player, GameState):- Player=='Black', nth0(1, GameState, BlackCubes), BlackCubes==0.
isWinner(Player, GameState):- Player=='White', nth0(2, GameState, WhiteCubes), WhiteCubes==0.

/*
 * checkGameOver(+Board, +Color)
 *
 * Succeeds if the player of color Color loses by not controlling any disc and displays the game over message.
 *
 */
checkGameOver(Board, Color):-
	isGameOver(Board, Color), !,
	(Color == 'w' -> (sleep(1), clearConsole, displayGameOverMessageBlack, sleep(2), nl); (sleep(1), clearConsole, displayGameOverMessageWhite, sleep(2), nl)).
	
/*
 * isGameOver(+Board, +Color)
 *
 * Succeeds if the player of color Color loses by not controlling any disc.
 *
 */
isGameOver([], _).
isGameOver([H|T], Color):-
	lineHasNoStacks(H, Color),
	isGameOver(T, Color).

/*
 * lineHasNoStacks(+Line, +Color)
 *
 * Succeeds if the player of color Color doesn't control any stacks in the line Line.
 *
 */
lineHasNoStacks([], _).
lineHasNoStacks([H|T], Color):-
	hasNoStacks(H, Color), !,
	lineHasNoStacks(T, Color).	

/*
 * lineHasNoStacks(+Stack, +Color)
 *
 * Succeeds if the player of color Color does not control a stack in the cell Stack.
 *
 */
hasNoStacks(Stack, Color):-			
	getTopPiece(Stack, Piece), !,
	\+Piece == Color.	

/*
 * countCubesBoard(+CubeColor, +Board, +NumCubesCurrent, -NumCubes)
 *
 * Counts the number of cubes of type CubeColor in the board and returns it in NumCubes.
 *
 */
countCubesBoard(_, [], NumCubesCurrent, NumCubesCurrent).
countCubesBoard(CubeColor, [Head|Tail], NumCubesCurrent, NumCubes):- countCubesRow(CubeColor, Head, 0, NumCubesRow), NumCubesCurrentNew is NumCubesCurrent + NumCubesRow, countCubesBoard(CubeColor, Tail, NumCubesCurrentNew, NumCubes).

/*
 * countCubesRow(+CubeColor, +Row, +NumCubesCurrent, -NumCubes)
 *
 * Counts the number of cubes of type CubeColor in the received row and returns it in NumCubes.
 *
 */
countCubesRow(_, [], NumCubesCurrent, NumCubesCurrent).
countCubesRow(CubeColor, [Head|Tail], NumCubesCurrent, NumCubesFinal):- getTopPiece(Head, Piece), Piece == CubeColor, !, NumCubesCurrentNew is NumCubesCurrent+1, countCubesRow(CubeColor, Tail, NumCubesCurrentNew, NumCubesFinal).
countCubesRow(CubeColor, [_|Tail], NumCubesCurrent, NumCubesFinal):- countCubesRow(CubeColor, Tail, NumCubesCurrent, NumCubesFinal).

/*
 * prepCellSource(+Cell, +NumberOfPiecesToMove, -NewCell)
 *
 * Takes NumberOfPiecesToMove pieces from Cell and refills it with atoms representing an empty space. Used when moving pieces.
 *
 */
prepCellSource(Cell, NumberOfPiecesToMove, NewCell):- 	removeFirstNElements(NumberOfPiecesToMove, Cell, CellAfter),
														refillList(CellAfter, NewCell).

/*
 * prepCellDest(+Cell, +PiecesToAdd, -NewCell)
 *
 * Adds PiecesToAdd to the beginning of the cell and removes the exceeding 'e' atoms. Used when moving pieces.
 *
 */
prepCellDest([wC, e, e, e, e, e, e, e, e, e, e, e], PiecesToAdd, NewCell):- Cell = [e, e, e, e, e, e, e, e, e, e, e, e], append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).
prepCellDest([bC, e, e, e, e, e, e, e, e, e, e, e], PiecesToAdd, NewCell):- Cell = [e, e, e, e, e, e, e, e, e, e, e, e], append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).
prepCellDest(Cell, PiecesToAdd, NewCell):- append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).

/*
 * insertCube(+Cell, -NewCell, +Color)
 *
 * Places a cube in Cell if one needs to be placed, else leaves the cell as it is.
 *
 */
insertCube(Cell, NewCell, w):- Cell == [e, e, e, e, e, e, e, e, e, e, e, e], !, NewCell = [wC, e, e, e, e, e, e, e, e, e, e, e].
insertCube(Cell, Cell, w).
insertCube(Cell, NewCell, b):- Cell == [e, e, e, e, e, e, e, e, e, e, e, e], !, NewCell = [bC, e, e, e, e, e, e, e, e, e, e, e].
insertCube(Cell, Cell, b).

/*
 * movePieces(+Board, +Move, -NewBoard)
 *
 * Performs the move (X1, Y1) -> (X2, Y2) and returns a new board with the move already performed
 *
 */
movePieces(Board, [X1, Y1, X2, Y2|_], NewBoard):- 	getMatrixValue(X1, Y1, Board, SourceCell), getMatrixValue(X2, Y2, Board, DestCell),
													getDistance(X1, Y1, X2, Y2, Distance),
													getFirstNElements(Distance, SourceCell, [], PiecesToMove),
													prepCellSource(SourceCell, Distance, TempSourceCell),
													prepCellDest(DestCell, PiecesToMove, NewDestCell),
													getTopPiece(SourceCell, TopPiece),
													insertCube(TempSourceCell, NewSourceCell, TopPiece),
													replaceInBoard(Board, X1, Y1, NewSourceCell, TempBoard),
													replaceInBoard(TempBoard, X2, Y2, NewDestCell, NewBoard).

/*
 * move(+GameState, +Move, -NewGameState)
 *
 * Performs the move (X1, Y1) -> (X2, Y2) and returns a new game state with the move already performed
 *
 */
move(GameState, Move, NewGameState):- 	nth0(0, GameState, Board),
										movePieces(Board, Move, NewBoard),
										countCubesBoard(bC, NewBoard, 0, BlackCubes),
										countCubesBoard(wC, NewBoard, 0, WhiteCubes),
										ActualBlackCubes is 9 - BlackCubes,
										ActualWhiteCubes is 9 - WhiteCubes,
										NewGameState = [NewBoard, ActualBlackCubes, ActualWhiteCubes].

