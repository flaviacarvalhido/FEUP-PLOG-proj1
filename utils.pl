:- use_module(library(lists)).

test_get:- get_matrix_value(2, 1, [[1, 2, 3],
									[4, 5, 6],
									[7, 8, 9]
									], Res).

getMatrixValue(NRow, NCol, Matrix, Res):- nth0(NRow, Matrix, Row),
											nth0(Ncol, Row, Res).

getTopPiece([H|_], H).

getNumPiecesInCell([H|T], Acc, Result):- H \= e, !, AccNew is Acc+1, getNumPiecesInCell(T, AccNew, Result).
getNumPiecesInCell(_, Acc, Acc):- !.

getDistance(X1, Y1, X2, Y2, Distance):- X1 =:= X2, !, Distance is abs(Y1-Y2).
getDistance(X1, Y1, X2, Y2, Distance):- Distance is abs(X1-X2).

addToList(ListToAdd, TargetList, NewList):- append(ListToAdd, TargetList, NewList).

% Need a predicate to remove from list the extra empty spots