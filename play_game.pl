
:-include('game_logic.pl').
:-include('board.pl').
:-include('ai.pl').
:-use_module(library(system)).

playGamePlayerVsPlayer:- initial(GameState), playGamePlayerVsPlayer(GameState, w).
playGamePlayerVsPlayer(GameState, w):-	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										displayGame(GameState, 'White'),
										askForPiece(InitialPos, 'White', Board),
										askForMove(InitialPos, GameState, Move),
										move(GameState, Move, NewGameState),
										decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes),
										\+checkGameOver(NewBoard, b),
										\+checkWinner('White', NewGameState),
										!, playGamePlayerVsPlayer(NewGameState, b).
playGamePlayerVsPlayer(GameState, b):-	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
										displayGame(GameState, 'Black'),
										askForPiece(InitialPos, 'Black', Board),
										askForMove(InitialPos, GameState, Move),
										move(GameState, Move, NewGameState),
										decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes),
										\+checkGameOver(NewBoard, w),
										\+checkWinner('Black', NewGameState),
										!, playGamePlayerVsPlayer(NewGameState, w).

playGamePlayerVsComputer(BotDiff):- initial(GameState), playGamePlayerVsComputer(GameState, BotDiff).
playGamePlayerVsComputer(GameState, BotDiff):- 	decomposeState(GameState, Board, WhiteCubes, BlackCubes),
											displayGame(GameState, 'White'),
											% Ask for input move
											% Check if move is valid
											move(GameState, Move, NewGameState),
											decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes),
											\+checkGameOver(NewBoard, b),
											\+checkWinner('White', NewGameState),
											% Now it's the bot's turn
											displayGame(NewGameState, 'Black'),
											choose_move(NewGameState, b, BotDiff, BotMove),
											move(NewGameState, BotMove, FinalGameState),
											decomposeState(FinalGameState, FinalBoard, FinalWhiteCubes, FinalBlackCubes),
											\+checkGameOver(FinalBoard, w),
											\+checkWinner('Black', FinalGameState),
											!, playGamePlayerVsComputer(FinalGameState, BotDiff).


playGameComputerVsPlayer(BotDiff):- initial(GameState), playGameComputerVsPlayer(GameState, BotDiff).
playGameComputerVsPlayer(GameState, BotDiff):-	displayGame(GameState, 'White'),
												choose_move(GameState, w, BotDiff, BotMove),
												move(GameState, BotMove, NewGameState),
												decomposeState(NewGameState, NewBoard, NewWhiteCubes, NewBlackCubes),
												\+checkGameOver(NewBoard, b),
												\+checkWinner('White', NewGameState),
												% Player's turn
												displayGame(NewGameState, 'Black'),
												% Ask for input move
												% Check if move is valid
												move(NewGameState, Move, FinalGameState),
												decomposeState(FinalGameState, FinalBoard, FinalWhiteCubes, FinalBlackCubes),
												\+checkGameOver(FinalBoard, w),
												\+checkWinner('Black', FinalGameState),
												!, playGameComputerVsPlayer(FinalGameState, BotDiff).

playGameComputerVsComputer(Bot1Diff, Bot2Diff):- initial(GameState), playGameComputerVsComputer(GameState, Bot1Diff, Bot2Diff).
playGameComputerVsComputer(GameState, Bot1Diff, Bot2Diff):-	displayGame(GameState, 'White'),
															write('Displayed'), nl,
															sleep(1),
															write('Slept'), nl,
															choose_move(GameState, w, Bot1Diff, Bot1Move),
															write('Move chosen: '), write(Bot1Move), nl,
															move(GameState, Bot1Move, NewGameState),
															write('Pieces moved'), nl,
															decomposeState(NewGameState, NewBoard, _, _),
															write('Decomposed'), nl,
															\+checkGameOver(NewBoard, b),
															write('Game OverChecked'), nl,
															\+checkWinner('White', NewGameState),
															write('Winner checked'), nl,
															displayGame(NewGameState, 'Black'),
															write('Displayed'), nl,
															sleep(1),
															write('Slept'), nl,
															choose_move(NewGameState, b, Bot2Diff, Bot2Move),
															write('Move chosen: '), write(Bot2Move), nl,
															move(NewGameState, Bot2Move, FinalGameState),
															write('Pieces moved'), nl,
															decomposeState(FinalGameState, FinalBoard, _, _),
															write('Decomposed'), nl,
															\+checkGameOver(FinalBoard, w),
															write('Game Over Checked'), nl,
															\+checkWinner('Black', FinalGameState),
															write('Winner checked'), nl,
															!, playGameComputerVsComputer(FinalGameState, Bot1Diff, Bot2Diff).