:- use_module(library(lists)).
:-include('game_logic.pl').
:-include('utils.pl').


% Numero de peças pertencentes ao jogador
evaluateBoard(Board, Color):- getNumPiecesOfColorBoard(Board, Color, 0, NumPieces).

getNumPiecesOfColorBoard([], _, StartNum, StartNum).
getNumPiecesOfColorBoard([Head|Tail], Color, StartNum, Num):- 	getNumPiecesOfColorRow(Head, Color, 0, NumPiecesRow),
																StartNumNew is StartNum + NumPiecesRow,
																getNumPiecesOfColorBoard(Tail, Color, StartNumNew, Num).

getNumPiecesOfColorRow([], _, StartNum, StartNum).
getNumPiecesOfColorRow([Head|Tail], Color, StartNum, Num):- getTopPiece(Head, Piece),
															Piece == Color, !,
															getNumPiecesInCell(Head, 0, NumPieces),
															StartNumNew is StartNum + NumPieces,
															getNumPiecesOfColorRow(Tail, Color, StartNumNew, Num).
getNumPiecesOfColorRow([Head|Tail], Color, StartNum, Num):- getNumPiecesOfColorRow(Tail, Color, StartNum, Num).

getAllValidMoves(Board, Moves, Color):- findall(X1, validMove([X1, Y1, X2, Y2|_], Board, Color), Moves).