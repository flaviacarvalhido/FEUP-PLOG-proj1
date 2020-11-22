:- use_module(library(lists)).
:-include('game_logic.pl').
:-include('utils.pl').
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

getAllValidMoves(Board, Moves, Color):- write('Before setof'), nl,setof([X1, Y1, X2, Y2], (between(0, 4, X1), between(0, 4, Y1), between(0, 4, X2), between(0, 4, Y2), isMoveValidColor(Color, [X1, Y1, X2, Y2], Board), validMove([X1, Y1, X2, Y2|_], Board)), Moves), write('After setof'), nl.

sortMovesByScore(Board, SortedMoves, Color):-	write('Going to get all moves'), nl,
												getAllValidMoves(Board, Moves, Color),
												write('Got All Valid Moves: '), write(Moves), nl,
												getScoreMoves(Moves, [], Scores, Board, Color),
												write('Got Scores: '), write(Scores),  nl,
												mapScoreMoves(Scores, Moves, MappedScoreMoves),
												write('Mapped scores and moves: '), write(MappedScoreMoves), nl,
												sort(MappedScoreMoves, SortedMoves), write('Sorted: '), write(SortedMoves), nl.

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

getBestMove(Moves, ChosenMove):- reverse(Moves, BestToWorstMoves), nth0(0, BestToWorstMoves, MoveWithScore), nth0(1, MoveWithScore, ChosenMove).

valid_moves(GameState, Player, ListOfMoves):- nth0(0, GameState, Board), getAllValidMoves(Board, ListOfMoves, Color).

choose_move(GameState, Player, 1, Move):- 	nth0(0, GameState, Board),
											write('Got Board'), nl,
											sortMovesByScore(Board, Moves, Player),
											write('Sorted Moves: '), nl,
											write(Moves), nl,
											getRandomMove(Moves, Move), write('Got Move: '), write(Move), nl.
choose_move(GameState, Player, 2, Move):-	nth0(0, GameState, Board),
											write('Got Board'), nl,
											sortMovesByScore(Board, Moves, Player),
											write('Sorted Moves: '), nl,
											write(Moves), nl,
											getBestMove(Moves, Move), write(Move), nl.