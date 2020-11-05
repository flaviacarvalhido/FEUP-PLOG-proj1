:- use_module(library(lists)).
:-include('utils.pl').


validCoords(NRows, Ncols, X, Y):- X < Ncols, X >= 0, Y < Nrows, Y >= 0.

sameLine(X1, Y1, X2, Y2):- X1 =:= X2; Y1 =:= Y2.


% Not tested
validMove([X1, Y1, X2, Y2|_], Board, Color):- 	validCoords(5, 5, X1, Y1), validCoords(5, 5, X2, Y2),
												getMatrixValue(Y1, X1, Board, Value), getNumPiecesInCell(Value, 0, NumPieces)
												sameLine(X1, Y1, X2, Y2),
												getTopPiece(Value, Piece), Piece =:= Color,
												getDistance(X1, Y1, X2, Y2, Distance), Distance > 0, Distance < 5, Distance =< NumPieces.


movePieces(Board, Move):- 
