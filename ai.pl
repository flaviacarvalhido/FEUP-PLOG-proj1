:- use_module(library(between)).
:-use_module(library(random)).


% Numero de peças pertencentes ao jogador
evaluateState(GameState, w, Score):- decomposeState(GameState, Board, WhiteCubes, BlackCubes), getNumPiecesOfColorBoard(Board, w, 0, NumPieces), Score is NumPieces + 9 - WhiteCubes - (9-BlackCubes).
evaluateState(GameState, b, Score):- decomposeState(GameState, Board, WhiteCubes, BlackCubes), getNumPiecesOfColorBoard(Board, b, 0, NumPieces), Score is NumPieces + 9 - BlackCubes - (9-WhiteCubes).

value(GameState, Player, Value):- evaluateState(GameState, Player, Value).

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

getAllValidMoves(Board, Moves, Color):- setof([X1, Y1, X2, Y2], (between(0, 5, X1), between(0, 5, Y1), between(0, 5, X2), between(0, 5, Y2), isMoveValidColor(Color, [X1, Y1, X2, Y2], Board), validMove([X1, Y1, X2, Y2|_], Board)), Moves).


sortMovesByScore(Board, SortedMoves, Color):- 	getAllValidMoves(Board, Moves, Color),
												getScoreMoves(Moves, [], Scores, Board, Color),
												mapScoreMoves(Scores, Moves, MappedScoreMoves),
												sort(MappedScoreMoves, SortedMoves).

getScoreMoves([], Scores, Scores, _, _).
getScoreMoves([Move|MovesTail], Scores, FinalScores, Board, Color):-
														movePieces(Board, Move, NewBoard),
														countCubesBoard(bC, NewBoard, 0, NumBlackCubes), countCubesBoard(wC, NewBoard, 0, NumWhiteCubes),
														GameState = [NewBoard, NumBlackCubes, NumWhiteCubes],
														evaluateState(GameState, Color, Score),
														getScoreMoves(MovesTail, [Score|Scores], FinalScores, Board, Color).

mapScoreMoves([Score|[]], [Move|[]], [[Score, Move]]).
mapScoreMoves([Score|RestScores], [Move|RestMoves], [[Score, Move]| ScoreMoves]):- mapScoreMoves(RestScores, RestMoves, ScoreMoves).

getRandomMove(Moves, ChosenMove):- length(Moves, Len), random(0, Len, Idx), nth0(Idx, Moves, MoveWithScore), nth0(1, MoveWithScore, ChosenMove).

getBestMove(Moves, ChosenMove):- reverse(Moves, BestToWorstMoves), nth0(0, BestToWorstMoves, ChosenMove).

valid_moves(GameState, Player, ListOfMoves):- nth0(0, GameState, Board), getAllValidMoves(Board, ListOfMoves, Color).

choose_move(GameState, Player, 0, Move):- 	nth0(0, GameState, Board),
											sortMovesByScore(Board, Moves, Player),
											getRandomMove(Moves, Move).
choose_move(GameState, Player, 1, Move):-	nth0(0, GameState, Board),
											sortMovesByScore(Board, Moves, Player),
											getBestMove(Moves, Move).