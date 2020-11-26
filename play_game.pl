
:-include('game_logic.pl').
:-include('board.pl').
:-include('ai.pl').
:-use_module(library(system)).

playGamePlayerVsPlayer:- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopPlayerVsPlayer(GameState, w).
gameLoopPlayerVsPlayer(GameState, w):-	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										askForPiece(InitialPos, 'White', Board),
										askForMove(InitialPos, GameState, Move),
										move(GameState, Move, NewGameState),
										decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes), !,
										clearConsole,
										displayGame(NewGameState, 'Black'), !,
										\+checkGameOver(NewBoard, b),
										\+checkWinner('White', NewGameState),
										!, gameLoopPlayerVsPlayer(NewGameState, b).
gameLoopPlayerVsPlayer(GameState, b):-	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										askForPiece(InitialPos, 'Black', Board),
										askForMove(InitialPos, GameState, Move),
										move(GameState, Move, NewGameState),
										decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes), !,
										clearConsole,
										displayGame(NewGameState, 'White'), !,
										\+checkGameOver(NewBoard, w),
										\+checkWinner('Black', NewGameState),
										!, gameLoopPlayerVsPlayer(NewGameState, w).

playGamePlayerVsComputer(BotDiff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopPlayerVsComputer(GameState, BotDiff).
gameLoopPlayerVsComputer(GameState, BotDiff):- 	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
												askForPiece(InitialPos, 'White', Board),
												askForMove(InitialPos, GameState, Move),
												move(GameState, Move, NewGameState),
												decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes), !,
												clearConsole,
												displayGame(NewGameState, 'Black'), !,
												\+checkGameOver(NewBoard, b),
												\+checkWinner('White', NewGameState),
												% Now it's the bot's turn
												sleep(1),
												choose_move(NewGameState, b, BotDiff, BotMove),
												move(NewGameState, BotMove, FinalGameState),
												decomposeState(FinalGameState, FinalBoard, FinalWhiteCubes, FinalBlackCubes), !,
												clearConsole,
												displayGame(FinalGameState, 'White'), !,
												\+checkGameOver(FinalBoard, w),
												\+checkWinner('Black', FinalGameState),
												!, gameLoopPlayerVsComputer(FinalGameState, BotDiff).


playGameComputerVsPlayer(BotDiff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopComputerVsPlayer(GameState, BotDiff).
gameLoopComputerVsPlayer(GameState, BotDiff):-	sleep(1),
												choose_move(GameState, w, BotDiff, BotMove),
												move(GameState, BotMove, NewGameState),
												decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes), !,
												clearConsole,
												displayGame(NewGameState, 'Black'), !,
												\+checkGameOver(NewBoard, b),
												\+checkWinner('White', NewGameState),
												% Player's turn
												askForPiece(InitialPos, 'Black', Board),
												askForMove(InitialPos, GameState, Move),
												move(NewGameState, Move, FinalGameState),
												decomposeState(FinalGameState, FinalBoard, FinalWhiteCubes, FinalBlackCubes), !,
												clearConsole,
												displayGame(FinalGameState, 'White'), !,
												\+checkGameOver(FinalBoard, w),
												\+checkWinner('Black', FinalGameState),
												!, gameLoopComputerVsPlayer(FinalGameState, BotDiff).

playGameComputerVsComputer(Bot1Diff, Bot2Diff):- clearConsole, initial(GameState), displayGame(GameState, 'White'), !, gameLoopComputerVsComputer(GameState, Bot1Diff, Bot2Diff).
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