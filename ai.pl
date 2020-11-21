:- use_module(library(lists)).
:-include('game_logic.pl').
:-include('utils.pl').
:- use_module(library(between)).


% Numero de peças pertencentes ao jogador
evaluateState(GameState, w, Score):- decomposeState(GameState, Board, WhiteCubes, BlackCubes), getNumPiecesOfColorBoard(Board, w, 0, NumPieces), Score is NumPieces + 9 - WhiteCubes - (9-BlackCubes).
evaluateState(GameState, b, Score):- decomposeState(GameState, Board, WhiteCubes, BlackCubes), getNumPiecesOfColorBoard(Board, b, 0, NumPieces), Score is NumPieces + 9 - BlackCubes - (9-WhiteCubes).


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

getAllValidMoves(Board, Moves):- setof([X1, Y1, X2, Y2], (between(0, 5, X1), between(0, 5, Y1), between(0, 5, X2), between(0, 5, Y2), validMove([X1, Y1, X2, Y2|_], Board)), Moves).


sortMovesByScore(Board, SortedMoves, Color):- getAllValidMoves(Board, Moves), mapScoreMoves(Moves, [], Scores, Board, Color), pairs_keys_values(ScoreMovePairs, Scores, Moves), keysort(ScoreMovePairs, SortedScoreMovePairs), pairs_values(SortedScoreMovePairs, SortedMoves).

mapScoreMoves([], Scores, Scores, _, _).
mapScoreMoves([Move|MovesTail], Scores, FinalScores, Board, Color):-
														movePieces(Board, Move, NewBoard),
														countCubesBoard(bC, NewBoard, 0, NumBlackCubes), countCubesBoard(wC, NewBoard, 0, NumWhiteCubes),
														GameState = [NewBoard, NumBlackCubes, NumWhiteCubes],
														evaluateState(GameState, Color, Score),
														mapScoreMoves(MovesTail, [Score|Scores], FinalScores, Board, Color).