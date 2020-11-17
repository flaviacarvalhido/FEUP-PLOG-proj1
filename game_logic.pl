:- use_module(library(lists)).
:-include('utils.pl').


validCoords(Nrows, Ncols, X, Y):- X < Ncols, X >= 0, Y < Nrows, Y >= 0.

sameLine(X1, Y1, X2, Y2):- X1 =:= X2; Y1 =:= Y2.


% Not tested
validMove([X1, Y1, X2, Y2|_], Board, Color):- 	validCoords(5, 5, X1, Y1), validCoords(5, 5, X2, Y2),
												getMatrixValue(Y1, X1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces),
												sameLine(X1, Y1, X2, Y2),
												getTopPiece(Value, Piece), Piece == Color,
												getDistance(X1, Y1, X2, Y2, Distance), Distance > 0, Distance < 5, Distance =< NumPieces.


testPrep:- prepCellDest([b, b, b, b, b, b, e, e, e, e, e, e], [w, w, w], NewCell), printList(NewCell).



prepCellSource(Cell, NumberOfPiecesToMove, NewCell):- 	removeFirstNElements(NumberOfPiecesToMove, Cell, CellAfter),
														refillList(CellAfter, NewCell).
prepCellDest(Cell, PiecesToAdd, NewCell):- append(PiecesToAdd, Cell, TempCell), length(PiecesToAdd, Len), removeFromListEnd(Len, TempCell, NewCell).

movePieces(Board, [X1, Y1, X2, Y2|_], NewBoard):- 	getMatrixValue(X1, Y1, Board, SourceCell), getMatrixValue(X2, Y2, Board, DestCell),
													getDistance(X1, Y1, X2, Y2, Distance),
													getFirstNElements(Distance, SourceCell, [], PiecesToMove),
													prepCellSource(SourceCell, Distance, NewSourceCell),
													prepCellDest(DestCell, PiecesToMove, NewDestCell),
													replaceInMatrix(Board, X1, Y1, NewSourceCell, TempBoard),
													replaceInMatrix(TempBoard, X2, Y2, NewDestCell, NewBoard).

