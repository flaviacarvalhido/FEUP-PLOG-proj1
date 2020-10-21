
initial(GameState):- initialBoard(GameState).

initialBoard([
			[[black, black, black, black, black, black], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty]],
			[[empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty]],
			[[empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty]],
			[[empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty]],
			[[empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [empty, empty, empty, empty, empty, empty], [white, white, white, white, white, white]]
			]).

displayBoard([]).
displayBoard([L|T]):- displayLine(L), nl, displayIntermediateLine, nl, displayBoard(T).

displayIntermediateLine:-write('  |         |         |         |         |   ').

displayLine([]).
displayLine([C|L]):- displayCell(C), write(' -- '), displayLine(L).

displayCell([]).
displayCell([P|R]):- displayPiece(P), displayCell(R).

displayPiece(C):- getCode(C, Code), write(Code).

getCode(black, 'O').
getCode(white, 'X').
getCode(blackCube, 'I').
getCode(whiteCube, '&').
getCode(empty, ' ').