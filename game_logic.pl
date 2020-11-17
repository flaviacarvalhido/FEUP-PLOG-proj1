:- use_module(library(lists)).
:-include('utils.pl').


validCoords(Nrows, Ncols, X, Y):- X < Ncols, X >= 0, Y < Nrows, Y >= 0.

sameRowOrColumn(X1, Y1, X2, Y2):- X1 =:= X2; Y1 =:= Y2.


/*move*/
%move(GameState, Move, NewGameState):-
	/*TODO*/



askForMove(Move, GameState):-			/*TODO: should receive valid moves*/
	get Answer asking 'What stack do you wish to move? (Row-Column)',
	split_string(Answer, "-", "", Coords),
	nth0(0, Coords, NewRow),
	nth0(1, Coords, NewColumn),
	nth0(0, Move, Row),
	nth0(1, Move, Column),
	nth0(0, GameState, Board),
	validMove([Column, Row, NewColumn, NewRow | _], Board),!.		/*TODO: instead of this, check if it is in list of valid moves*/

askForMove(Move, GameState):-
	write('Invalid Move.'),nl,
	askForMove(Move, GameState).

% Not tested
validMove([X1, Y1, X2, Y2|_], Board):- 			/*TODO:tem de haver um predicado que vê as valid moves todas e mete numa lista*/
	validCoords(5, 5, X2, Y2),							
	getMatrixValue(Y1, X1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces),
	sameRowOrColumn(X1, Y1, X2, Y2),							
	getDistance(X1, Y1, X2, Y2, Distance), Distance > 0, Distance < 5, Distance =< NumPieces.


/* movePieces(Board, Move):- !. */


/*ask stack to move*/
askForPiece(Move, Player, Board):-
	selectStack(Coords, Player, Board),
	Move is Coords.

selectStack(Coords, Player, Board):-
	get Stack asking 'What stack do you wish to move? (Row-Column)',
	split_string(Stack, "-", "", Coords),
	nth0(0, Coords, Row),
	nth0(1, Coords, Column),
	checkSelection(Column, Row, Player, Board),!.		/*checking for valid coords and if stack is from the player*/
	
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
	getTopDisc(Stack, Piece), 				/*check for cube or disc*/
	\+Piece == Color.	
																									
isDisc(T):- T == 'w'.
isDisc(T):- T == 'b'.

getTopDisc(Stack, Piece):-          
	getTopPiece(Stack, Piece),
	isDisc(Piece).


