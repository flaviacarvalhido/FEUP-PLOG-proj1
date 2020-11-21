:- use_module(library(lists)).
:-include('utils.pl').


validCoords(Nrows, Ncols, X, Y):- X < Ncols, X >= 0, Y < Nrows, Y >= 0.

sameRowOrColumn(X1, Y1, X2, Y2):- X1 =:= X2; Y1 =:= Y2.


/*move*/

/*testPrep:- prepCellDest([b, b, b, b, b, b, e, e, e, e, e, e], [w, w, w], NewCell), printList(NewCell).*/

move(GameState, Move, NewGameState):-
	movePieces(GameState,Move,NewGameState).
	

prepCellSource(Cell, NumberOfPiecesToMove, NewCell):- 	
	removeFirstNElements(NumberOfPiecesToMove, Cell, CellAfter),
	refillList(CellAfter, NewCell).

prepCellDest(Cell, PiecesToAdd, NewCell):- 
	append(PiecesToAdd, Cell, TempCell), 
	length(PiecesToAdd, Len), 
	removeFromListEnd(Len, TempCell, NewCell).

movePieces(GameState, [X1, Y1, X2, Y2|_], NewGameState):- 			/*TODO: make this the Move predicate instead of having two predicates*/
	[Board, BlackCubes, WhiteCubes] = GameState,
	[NewBoard, NewBlackCubes, NewWhiteCubes] = NewGameState,			/*TODO: NÃO É PRECISO TER NEWCUBES*/
	getMatrixValue(X1, Y1, Board, SourceCell), 
	getMatrixValue(X2, Y2, Board, DestCell),
	getDistance(X1, Y1, X2, Y2, Distance),
	getFirstNElements(Distance, SourceCell, [], PiecesToMove),
	prepCellSource(SourceCell, Distance, NewSourceCell),
	prepCellDest(DestCell, PiecesToMove, NewDestCell),
	replaceInMatrix(Board, X1, Y1, NewSourceCell, TempBoard),
	replaceInMatrix(TempBoard, X2, Y2, NewDestCell, NewBoard),
	getTopDisc(PiecesToMove, PlayerColor),
	updateCubes(BlackCubes, WhiteCubes, NewSourceCell, DestCell, PlayerColor, NewBoard).
	/*TODO: update new game state*/

updateCubes(BlackCubes, WhiteCubes, NewSourceCell, DestCell, PlayerColor, NewBoard):-
	getTopPiece(NewSourceCell, LeftPiece),
	(LeftPiece=='e', PlayerColor == 'b' -> Cube is 'bC', NewBlackCubes is BlackCubes-1; Cube is 'wC', NewWhiteCubes is WhiteCubes-1),						
	/*TODO: ATUALIZAR newBOARD*/

	/*JUNÇÃO JÁ TINHA CUBO, cubo da já não existe por ter lavado overwrite*/
	/*BlackWhiteCubes are NewBlackWhiteCubes*/
	/*leave*/
																
/*ask for move (input)*/
askForMove(Move, GameState):-										/*TODO: should receive valid moves*/
	get Answer asking 'Where do you want to move the stack? (Row-Column)',
	split_string(Answer, "-", "", Coords),
	nth0(0, Coords, NewRow),
	nth0(1, Coords, NewColumn),
	nth0(0, Move, Row),
	nth0(1, Move, Column),
	nth0(0, GameState, Board),
	Move is [Column, Row, NewColumn, NewRow | _],					/*CAN i DO THIS?*/
	validMove([Column, Row, NewColumn, NewRow | _], Board),!.		/*TODO: instead of this, check if it is in list of valid moves*/

askForMove(Move, GameState):-
	write('Invalid Move.'),nl,
	askForMove(Move, GameState).

% Not tested
validMove([X1, Y1, X2, Y2|_], Board):- 								/*TODO:tem de haver um predicado que vê as valid moves todas e mete numa lista*/
	validCoords(5, 5, X2, Y2),							
	getMatrixValue(Y1, X1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces),
	sameRowOrColumn(X1, Y1, X2, Y2),							
	getDistance(X1, Y1, X2, Y2, Distance), Distance > 0, Distance < 5, Distance =< NumPieces.


/*ask stack to move*/
askForPiece(Move, Player, Board):-
	selectStack(Coords, Player, Board),
	Move is Coords.

selectStack(Coords, Player, Board):-
	get Stack asking 'What stack do you wish to move? (Row-Column)',
	split_string(Stack, "-", "", Coords),
	nth0(0, Coords, Row),
	nth0(1, Coords, Column),
	checkSelection(Column, Row, Player, Board),!.					/*checking for valid coords and if stack is from the player*/
	
selectStack(Coords, Player, Board):-
	write('Incorrect Selection.'),nl,
	selectStack(Coords, Player, Board).

checkSelection(Column, Row, Player, Board):-		
	validCoords(5, 5, Column, Row),
	getMatrixValue(Row, Column, Board, Stack), 
	checkPlayerColor(Player, Color),
	\+hasNoStacks(Stack, Color).



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
% checkGameOver(BoardState, Color)

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
	hasNoStacks(H, Color),
	lineHasNoStacks(T, Color).	


hasNoStacks(Stack, Color):-			
	getTopDisc(Stack, Piece), 									/*check for cube or disc*/
	\+Piece == Color.	
																									
isDisc(T):- T == 'w'.
isDisc(T):- T == 'b'.

getTopDisc(Stack, Piece):-          
	getTopPiece(Stack, Piece),
	isDisc(Piece).




