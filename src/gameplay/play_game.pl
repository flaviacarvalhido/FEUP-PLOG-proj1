:-include('game_logic.pl').			%FIXME: redundant but keeps the player-player game working??
:-include('../display/board.pl').
:-include('ai.pl').
:-use_module(library(system)).

/*
 * playGamePlayerVsPlayer/0
 *
 * Starts a new Player Vs Player game
 *
 */
playGamePlayerVsPlayer:- clearConsole, nl, initial(GameState), displayGame(GameState, 'White'), !, gameLoopPlayerVsPlayer(GameState).

/*
 * gameLoopPlayerVsPlayer(+GameState)
 *
 * Executes the game loop for a Player Vs Player game
 *
 */
gameLoopPlayerVsPlayer(GameState):-		decomposeState(GameState, Board, _, _),
										askForPiece(InitialPos, 'White', Board),
										askForMove(InitialPos, GameState, Move),
										move(GameState, Move, NewGameState),
										decomposeState(NewGameState, NewBoard, _, _), !,
										clearConsole,
										displayGame(NewGameState, 'Black'), !,
										\+checkGameOver(NewBoard, b),
										\+checkWinner('White', NewGameState),
										decomposeState(NewGameState, NewBoard, _, _),
										askForPiece(OtherInitialPos, 'Black', NewBoard),
										askForMove(OtherInitialPos, NewGameState, NewMove),
										move(NewGameState, NewMove, FinalGameState),
										decomposeState(FinalGameState, FinalBoard, _, _), !,
										clearConsole,
										displayGame(FinalGameState, 'White'), !,
										\+checkGameOver(FinalBoard, w),
										\+checkWinner('Black', FinalGameState),
										!, gameLoopPlayerVsPlayer(FinalGameState); true.

/*
 * playGamePlayerVsComputer/0
 *
 * Starts a new Player Vs Computer game
 *
 */
playGamePlayerVsComputer(BotDiff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopPlayerVsComputer(GameState, BotDiff).

/*
 * gameLoopPlayerVsComputer(+GameState, +BotDiff)
 *
 * Executes the game loop for a Player Vs Computer game, where the computer is a bot of difficulty BotDiff
 *
 */
gameLoopPlayerVsComputer(GameState, BotDiff):- 	decomposeState(GameState, Board, _, _),
												askForPiece(InitialPos, 'White', Board),
												askForMove(InitialPos, GameState, Move),
												move(GameState, Move, NewGameState),
												decomposeState(NewGameState, NewBoard, _, _), !,
												clearConsole,
												displayGame(NewGameState, 'Black'), !,
												\+checkGameOver(NewBoard, b),
												\+checkWinner('White', NewGameState),
												% Now it's the bot's turn
												sleep(1),
												choose_move(NewGameState, b, BotDiff, BotMove),
												move(NewGameState, BotMove, FinalGameState),
												decomposeState(FinalGameState, FinalBoard, _, _), !,
												clearConsole,
												displayGame(FinalGameState, 'White'), !,
												\+checkGameOver(FinalBoard, w),
												\+checkWinner('Black', FinalGameState),
												!, gameLoopPlayerVsComputer(FinalGameState, BotDiff).

/*
 * playGameComputerVsPlayer/0
 *
 * Starts a new Computer Vs Player game
 *
 */
playGameComputerVsPlayer(BotDiff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopComputerVsPlayer(GameState, BotDiff).

/*
 * gameLoopComputerVsPlayer(+GameState, +BotDiff)
 *
 * Executes the game loop for a Computer Vs Player game, where the computer is a bot of difficulty BotDiff
 *
 */
gameLoopComputerVsPlayer(GameState, BotDiff):-	sleep(1),
												choose_move(GameState, w, BotDiff, BotMove),
												move(GameState, BotMove, NewGameState),
												decomposeState(NewGameState, NewBoard, _, _), !,
												clearConsole,
												displayGame(NewGameState, 'Black'), !,
												\+checkGameOver(NewBoard, b),
												\+checkWinner('White', NewGameState),
												% Player's turn
												decomposeState(NewGameState, NewBoard, _, _),
												askForPiece(InitialPos, 'Black', NewBoard),
												askForMove(InitialPos, GameState, Move),
												move(NewGameState, Move, FinalGameState),
												decomposeState(FinalGameState, FinalBoard, _, _), !,
												clearConsole,
												displayGame(FinalGameState, 'White'), !,
												\+checkGameOver(FinalBoard, w),
												\+checkWinner('Black', FinalGameState),
												!, gameLoopComputerVsPlayer(FinalGameState, BotDiff).

/*
 * playGameComputerVsComputer/0
 *
 * Starts a new Computer Vs Computer game
 *
 */
playGameComputerVsComputer(Bot1Diff, Bot2Diff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopComputerVsComputer(GameState, Bot1Diff, Bot2Diff).

/*
 * gameLoopComputerVsComputer(+GameState, +Bot1Diff, +Bot2Diff)
 *
 * Executes the game loop for a Computer Vs Computer game, where computer 1 is a bot of difficulty Bot1Diff and computer 2 is a bot of difficulty Bot2Diff
 *
 */
gameLoopComputerVsComputer(GameState, Bot1Diff, Bot2Diff):-	sleep(1),
															choose_move(GameState, w, Bot1Diff, Bot1Move),
															move(GameState, Bot1Move, NewGameState),
															decomposeState(NewGameState, NewBoard, _, _), !,
															clearConsole,
															displayGame(NewGameState, 'Black'), !,
															\+checkGameOver(NewBoard, b),
															\+checkWinner('White', NewGameState),
															sleep(1),
															choose_move(NewGameState, b, Bot2Diff, Bot2Move),
															move(NewGameState, Bot2Move, FinalGameState),
															decomposeState(FinalGameState, FinalBoard, _, _), !,
															clearConsole,
															displayGame(FinalGameState, 'White'), !,
															\+checkGameOver(FinalBoard, w),
															\+checkWinner('Black', FinalGameState),
															!, gameLoopComputerVsComputer(FinalGameState, Bot1Diff, Bot2Diff).