:- use_module(library(lists)).
:-include('game_logic.pl').
:-include('utils.pl').
:- use_module(library(between)).
:-use_module(library(random)).

/*
 * evaluateState(+GameState, +Color, -Score)
 *
 * Evaluates the received game state and gives it a score based on who's playing next
 *
 */
evaluateState(GameState, w, Score):- 	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										getNumPiecesOfColorBoard(Board, w, 0, NumPiecesWhite),
										getNumPiecesOfColorBoard(Board, b, 0, NumPiecesBlack),
										Score is NumPiecesWhite - NumPiecesBlack + 9 - WhiteCubes - (9-BlackCubes).
evaluateState(GameState, b, Score):- 	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										getNumPiecesOfColorBoard(Board, b, 0, NumPiecesBlack),
										getNumPiecesOfColorBoard(Board, w, 0, NumPiecesWhite),
										Score is NumPiecesBlack - NumPiecesWhite + 9 - BlackCubes - (9-WhiteCubes).

/*
 * value(+GameState, +Player, -Value)
 *
 * Evaluates the received game state and gives it a score based on who's playing next
 *
 */
value(GameState, Player, Value):- evaluateState(GameState, Player, Value).

/*
 * getNumPiecesOfColorBoard(+Board, +Color, +StartNum, -Num)
 *
 * Returns in Num the number of pieces of color Color on top of board cells
 * (StartNum must be an empty list when calling this predicate)
 *
 */
getNumPiecesOfColorBoard([], _, StartNum, StartNum).
getNumPiecesOfColorBoard([Head|Tail], Color, StartNum, Num):- 	getNumPiecesOfColorRow(Head, Color, 0, NumPiecesRow),
																StartNumNew is StartNum + NumPiecesRow,
																getNumPiecesOfColorBoard(Tail, Color, StartNumNew, Num).

/*
 * getNumPiecesOfColorRow(+Row, +Color, +StartNum, -Num)
 *
 * Returns in Num the number of pieces of color Color on top of row cells
 * (StartNum must be an empty list when calling this predicate)
 *
 */
getNumPiecesOfColorRow([], _, StartNum, StartNum).
getNumPiecesOfColorRow([Head|Tail], Color, StartNum, Num):- getTopPiece(Head, Piece),
															Piece == Color, !,
															getNumPiecesInCell(Head, 0, NumPieces),
															StartNumNew is StartNum + NumPieces,
															getNumPiecesOfColorRow(Tail, Color, StartNumNew, Num).
getNumPiecesOfColorRow([Head|Tail], Color, StartNum, Num):- getNumPiecesOfColorRow(Tail, Color, StartNum, Num).

/*
 * getAllValidMoves(+Board, -Moves, +Color)
 *
 * Returns in Moves a list with all the valid moves that the player of color Color can play
 *
 */
getAllValidMoves(Board, Moves, Color):- setof([X1, Y1, X2, Y2], (between(0, 4, X1), between(0, 4, Y1), between(0, 4, X2), between(0, 4, Y2), isMoveValidColor(Color, [X1, Y1, X2, Y2], Board), validMove([X1, Y1, X2, Y2|_], Board)), Moves).

/*
 * sortMovesByScore(+Board, -SortedMoves, +Color)
 *
 * Returns in SortedMoves a list with all the valid moves that the player of color Color can play, sorted by score (score is calculated using the value/3 predicate)
 *
 */
sortMovesByScore(Board, SortedMoves, Color):-	getAllValidMoves(Board, Moves, Color),
												getScoreMoves(Moves, [], Scores, Board, Color),
												reverse(Scores, NewScores),
												mapScoreMoves(NewScores, Moves, MappedScoreMoves),
												sort(MappedScoreMoves, SortedMoves).

/*
 * getScoreMoves(+Moves, +Scores, -FinalScores, +Board, +Color)
 *
 * Executes all the moves in Moves and calculates their respective score. Scores are returned in a list, FinalScores.
 *
 */
getScoreMoves([], Scores, Scores, _, _).
getScoreMoves([Move|MovesTail], Scores, FinalScores, Board, Color):-
														movePieces(Board, Move, NewBoard),
														countCubesBoard(bC, NewBoard, 0, NumBlackCubes), countCubesBoard(wC, NewBoard, 0, NumWhiteCubes),
														GameState = [NewBoard, NumBlackCubes, NumWhiteCubes],
														value(GameState, Color, Score),
														getScoreMoves(MovesTail, [Score|Scores], FinalScores, Board, Color).

/*
 * mapScoreMoves(+Scores, +Moves, -ScoreMoves)
 *
 * Maps the moves to their respective scores and returns them in ScoreMoves in the following format: [Score, Move], where Move is a list [X1, Y1, X2, Y2]
 *
 */
mapScoreMoves([Score|[]], [Move|[]], [[Score, Move]]).
mapScoreMoves([Score|RestScores], [Move|RestMoves], [[Score, Move]| ScoreMoves]):- mapScoreMoves(RestScores, RestMoves, ScoreMoves).

/*
 * getRandomMove(+Moves, -ChosenMove)
 *
 * Returns in ChosenMove a random move from the available valid moves pool.
 *
 */
getRandomMove(Moves, ChosenMove):- length(Moves, Len), random(0, Len, Idx), nth0(Idx, Moves, MoveWithScore), nth0(1, MoveWithScore, ChosenMove).

/*
 * getBestMove(+Moves, -ChosenMove)
 *
 * Returns in Moves the move with the highest score from the available valid moves pool.
 *
 */
getBestMove(Moves, ChosenMove):- 
	reverse(Moves, BestToWorstMoves),
	nth0(0, BestToWorstMoves, MoveWithScore),
	nth0(1, MoveWithScore, ChosenMove).

/*
 * valid_moves(+GameState, +Player, -ListOfMoves)
 *
 * Returns in ListOfMoves all the valid moves, for both players
 *
 */
valid_moves(GameState, Player, ListOfMoves):- nth0(0, GameState, Board), getAllValidMoves(Board, ListOfMoves, Player).

/*
 * choose_move(+GameState, +Player, +BotLevel, -Move)
 *
 * Chooses a move from the valid moves pool based on the bot's difficulty level
 *
 */
choose_move(GameState, Player, 1, Move):- 	nth0(0, GameState, Board),
											sortMovesByScore(Board, Moves, Player),
											getRandomMove(Moves, Move).
choose_move(GameState, Player, 2, Move):-	nth0(0, GameState, Board),
											sortMovesByScore(Board, Moves, Player),
											getBestMove(Moves, Move).