
/*
 * displayGameOverMessageBlack/0
 *
 * Displays the game over message for when black loses
 *
 */
displayGameOverMessageBlack:- 
					write(' ____________________________________________________________________________________________________________ '), nl,
					write('|                                                                                                            |'), nl,
					write('|               _______  _______  __   __  _______    _______  __   __  _______  ______                      |'), nl,
					write('|              |       ||   _   ||  |_|  ||       |  |       ||  | |  ||       ||    _ |                     |'), nl,
					write('|              |    ___||  |_|  ||       ||    ___|  |   _   ||  |_|  ||    ___||   | ||                     |'), nl,
					write('|              |   | __ |       ||       ||   |___   |  | |  ||       ||   |___ |   |_||_                    |'), nl,
					write('|              |   ||  ||       ||       ||    ___|  |  |_|  ||       ||    ___||    __  |                   |'), nl,
					write('|              |   |_| ||   _   || ||_|| ||   |___   |       | |     | |   |___ |   |  | |                   |'), nl,
					write('|              |_______||__| |__||_|   |_||_______|  |_______|  |___|  |_______||___|  |_|                   |'), nl,
					write('|            _______  ___      _______  _______  ___   _    _     _  ___   __    _  _______  __              |'), nl,
					write('|           |  _    ||   |    |   _   ||       ||   | | |  | | _ | ||   | |  |  | ||       ||  |             |'), nl,
					write('|           | |_|   ||   |    |  |_|  ||       ||   |_| |  | || || ||   | |   |_| ||  _____||  |             |'), nl,
					write('|           |       ||   |    |       ||       ||      _|  |       ||   | |       || |_____ |  |             |'), nl,
					write('|           |  _   | |   |___ |       ||      _||     |_   |       ||   | |  _    ||_____  ||__|             |'), nl,
					write('|           | |_|   ||       ||   _   ||     |_ |    _  |  |   _   ||   | | | |   | _____| | __              |'), nl,
					write('|           |_______||_______||__| |__||_______||___| |_|  |__| |__||___| |_|  |__||_______||__|             |'), nl,
					write('|                                                                                                            |'), nl,
					write(' ____________________________________________________________________________________________________________ '), nl.

/*
 * displayGameOverMessageWhite/0
 *
 * Displays the game over message for when white loses
 *
 */
displayGameOverMessageWhite:- 
					write(' ____________________________________________________________________________________________________________ '), nl,
					write('|                                                                                                            |'), nl,
					write('|               _______  _______  __   __  _______    _______  __   __  _______  ______                      |'), nl,
					write('|              |       ||   _   ||  |_|  ||       |  |       ||  | |  ||       ||    _ |                     |'), nl,
					write('|              |    ___||  |_|  ||       ||    ___|  |   _   ||  |_|  ||    ___||   | ||                     |'), nl,
					write('|              |   | __ |       ||       ||   |___   |  | |  ||       ||   |___ |   |_||_                    |'), nl,
					write('|              |   ||  ||       ||       ||    ___|  |  |_|  ||       ||    ___||    __  |                   |'), nl,
					write('|              |   |_| ||   _   || ||_|| ||   |___   |       | |     | |   |___ |   |  | |                   |'), nl,
					write('|              |_______||__| |__||_|   |_||_______|  |_______|  |___|  |_______||___|  |_|                   |'), nl,
					write('|            _     _  __   __  ___   _______  _______    _     _  ___   __    _  _______  __                 |'), nl,
					write('|           | | _ | ||  | |  ||   | |       ||       |  | | _ | ||   | |  |  | ||       ||  |                |'), nl,
					write('|           | || || ||  |_|  ||   | |_     _||    ___|  | || || ||   | |   |_| ||  _____||  |                |'), nl,
					write('|           |       ||       ||   |   |   |  |   |___   |       ||   | |       || |_____ |  |                |'), nl,
					write('|           |       ||       ||   |   |   |  |    ___|  |       ||   | |  _    ||_____  ||__|                |'), nl,
					write('|           |   _   ||   _   ||   |   |   |  |   |___   |   _   ||   | | | |   | _____| | __                 |'), nl,
					write('|           |__| |__||__| |__||___|   |___|  |_______|  |__| |__||___| |_|  |__||_______||__|                |'), nl,
					write('|                                                                                                            |'), nl,
					write(' ____________________________________________________________________________________________________________ '), nl.


/*
 * displayMainMenu/0
 *
 * Displays the main menu interface
 *
 */
displayMainMenu:-
					write(' ____________________________________________________________________________________________________________ '), nl,
					write('|                                                                                                            |'), nl,
					write('|               .-----------------. .----------------.  .----------------.  .----------------.               |'), nl,
					write('|              | .--------------. || .--------------. || .--------------. || .--------------. |              |'), nl,
					write('|              | | ____  _____  | || |      __      | || | ____   ____  | || |      __      | |              |'), nl,
					write('|              | ||_   \\|_   _| | || |     /  \\     | || ||_  _| |_  _| | || |     /  \\     | |              |'), nl,
					write('|              | |  |   \\ | |   | || |    / /\\ \\    | || |  \\ \\   / /   | || |    / /\\ \\    | |              |'), nl,
					write('|              | |  | |\\ \\| |   | || |   / ____ \\   | || |   \\ \\ / /    | || |   / ____ \\   | |              |'), nl,
					write('|              | | _| |_\\   |_  | || | _/ /    \\ \\_ | || |    \\ '' /     | || | _/ /    \\ \\_ | |              |'), nl,
					write('|              | ||_____|\\____| | || ||____|  |____|| || |     \\_/      | || ||____|  |____|| |              |'), nl,
					write('|              | |              | || |              | || |              | || |              | |              |'), nl,
					write('|              | ''--------------'' || ''--------------'' || ''--------------'' || ''--------------'' |              |'), nl,
					write('|               ''----------------''  ''----------------''  ''----------------''  ''----------------''               |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                    1 - Player vs Player                                                    |'), nl,
					write('|                                    2 - Player vs Computer                                                  |'), nl,
					write('|                                    3 - Computer vs Player                                                  |'), nl,
					write('|                                    4 - Computer vs Computer                                                |'), nl,
					write('|                                    5 - Game Instructions                                                   |'), nl,
					write('|                                    0 - Quit                                                                |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write(' ____________________________________________________________________________________________________________ '), nl.

/*
 * displayBotDifficultyMenu/0
 *
 * Displays the bot difficulty menu interface
 *
 */
displayBotDifficultyMenu:-
							write(' ____________________________________________________________________________________________________________ '), nl,
							write('|                                                                                                            |'), nl,
							write('|               .-----------------. .----------------.  .----------------.  .----------------.               |'), nl,
							write('|              | .--------------. || .--------------. || .--------------. || .--------------. |              |'), nl,
							write('|              | | ____  _____  | || |      __      | || | ____   ____  | || |      __      | |              |'), nl,
							write('|              | ||_   \\|_   _| | || |     /  \\     | || ||_  _| |_  _| | || |     /  \\     | |              |'), nl,
							write('|              | |  |   \\ | |   | || |    / /\\ \\    | || |  \\ \\   / /   | || |    / /\\ \\    | |              |'), nl,
							write('|              | |  | |\\ \\| |   | || |   / ____ \\   | || |   \\ \\ / /    | || |   / ____ \\   | |              |'), nl,
							write('|              | | _| |_\\   |_  | || | _/ /    \\ \\_ | || |    \\ '' /     | || | _/ /    \\ \\_ | |              |'), nl,
							write('|              | ||_____|\\____| | || ||____|  |____|| || |     \\_/      | || ||____|  |____|| |              |'), nl,
							write('|              | |              | || |              | || |              | || |              | |              |'), nl,
							write('|              | ''--------------'' || ''--------------'' || ''--------------'' || ''--------------'' |              |'), nl,
							write('|               ''----------------''  ''----------------''  ''----------------''  ''----------------''               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                      Choose Bot Difficulty                                                 |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                            1 - Easy                                                        |'), nl,
							write('|                                            2 - Medium                                                      |'), nl,
							write('|                                            3 - Hard                                                        |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write(' ____________________________________________________________________________________________________________ '), nl.

/*
 * displayBot1DifficultyMenu/0
 *
 * Displays the bot 1 difficulty menu interface
 *
 */
displayBot1DifficultyMenu:-
							write(' ____________________________________________________________________________________________________________ '), nl,
							write('|                                                                                                            |'), nl,
							write('|               .-----------------. .----------------.  .----------------.  .----------------.               |'), nl,
							write('|              | .--------------. || .--------------. || .--------------. || .--------------. |              |'), nl,
							write('|              | | ____  _____  | || |      __      | || | ____   ____  | || |      __      | |              |'), nl,
							write('|              | ||_   \\|_   _| | || |     /  \\     | || ||_  _| |_  _| | || |     /  \\     | |              |'), nl,
							write('|              | |  |   \\ | |   | || |    / /\\ \\    | || |  \\ \\   / /   | || |    / /\\ \\    | |              |'), nl,
							write('|              | |  | |\\ \\| |   | || |   / ____ \\   | || |   \\ \\ / /    | || |   / ____ \\   | |              |'), nl,
							write('|              | | _| |_\\   |_  | || | _/ /    \\ \\_ | || |    \\ '' /     | || | _/ /    \\ \\_ | |              |'), nl,
							write('|              | ||_____|\\____| | || ||____|  |____|| || |     \\_/      | || ||____|  |____|| |              |'), nl,
							write('|              | |              | || |              | || |              | || |              | |              |'), nl,
							write('|              | ''--------------'' || ''--------------'' || ''--------------'' || ''--------------'' |              |'), nl,
							write('|               ''----------------''  ''----------------''  ''----------------''  ''----------------''               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                      Choose Bot 1 Difficulty                                               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                            1 - Easy                                                        |'), nl,
							write('|                                            2 - Medium                                                      |'), nl,
							write('|                                            3 - Hard                                                        |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write(' ____________________________________________________________________________________________________________ '), nl.

/*
 * displayBot2DifficultyMenu/0
 *
 * Displays the bot 2 difficulty menu interface
 *
 */
displayBot2DifficultyMenu:-
							write(' ____________________________________________________________________________________________________________ '), nl,
							write('|                                                                                                            |'), nl,
							write('|               .-----------------. .----------------.  .----------------.  .----------------.               |'), nl,
							write('|              | .--------------. || .--------------. || .--------------. || .--------------. |              |'), nl,
							write('|              | | ____  _____  | || |      __      | || | ____   ____  | || |      __      | |              |'), nl,
							write('|              | ||_   \\|_   _| | || |     /  \\     | || ||_  _| |_  _| | || |     /  \\     | |              |'), nl,
							write('|              | |  |   \\ | |   | || |    / /\\ \\    | || |  \\ \\   / /   | || |    / /\\ \\    | |              |'), nl,
							write('|              | |  | |\\ \\| |   | || |   / ____ \\   | || |   \\ \\ / /    | || |   / ____ \\   | |              |'), nl,
							write('|              | | _| |_\\   |_  | || | _/ /    \\ \\_ | || |    \\ '' /     | || | _/ /    \\ \\_ | |              |'), nl,
							write('|              | ||_____|\\____| | || ||____|  |____|| || |     \\_/      | || ||____|  |____|| |              |'), nl,
							write('|              | |              | || |              | || |              | || |              | |              |'), nl,
							write('|              | ''--------------'' || ''--------------'' || ''--------------'' || ''--------------'' |              |'), nl,
							write('|               ''----------------''  ''----------------''  ''----------------''  ''----------------''               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                      Choose Bot 2 Difficulty                                               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                            1 - Easy                                                        |'), nl,
							write('|                                            2 - Medium                                                      |'), nl,
							write('|                                            3 - Hard                                                        |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                                                                            |'), nl,
							write(' ____________________________________________________________________________________________________________ '), nl.

/*
 * displayInstructions/0
 *
 * Displays instructions screen
 *
 */
displayInstructions:-
							write(' ____________________________________________________________________________________________________________ '), nl,
							write('|                                                                                                            |'), nl,
							write('|               .-----------------. .----------------.  .----------------.  .----------------.               |'), nl,
							write('|              | .--------------. || .--------------. || .--------------. || .--------------. |              |'), nl,
							write('|              | | ____  _____  | || |      __      | || | ____   ____  | || |      __      | |              |'), nl,
							write('|              | ||_   \\|_   _| | || |     /  \\     | || ||_  _| |_  _| | || |     /  \\     | |              |'), nl,
							write('|              | |  |   \\ | |   | || |    / /\\ \\    | || |  \\ \\   / /   | || |    / /\\ \\    | |              |'), nl,
							write('|              | |  | |\\ \\| |   | || |   / ____ \\   | || |   \\ \\ / /    | || |   / ____ \\   | |              |'), nl,
							write('|              | | _| |_\\   |_  | || | _/ /    \\ \\_ | || |    \\ '' /     | || | _/ /    \\ \\_ | |              |'), nl,
							write('|              | ||_____|\\____| | || ||____|  |____|| || |     \\_/      | || ||____|  |____|| |              |'), nl,
							write('|              | |              | || |              | || |              | || |              | |              |'), nl,
							write('|              | ''--------------'' || ''--------------'' || ''--------------'' || ''--------------'' |              |'), nl,
							write('|               ''----------------''  ''----------------''  ''----------------''  ''----------------''               |'), nl,
							write('|                                                                                                            |'), nl,
							write('|                                                  INSTRUCTIONS                                              |'), nl,
							write('|                    Each player starts with 6 discs in a stack and 9 cubes outside the board.               |'), nl,
							write('|              The objective is to capture all the opponent\'s stacks by placing a disc on top of them        |'), nl,
							write('|                or to place all our cubes on the board. If any of these conditions are met, we win!         |'), nl,
							write('|           Stacks can only move vertically or horizontally and we must move the same number of discs as     |'), nl,
							write('|            the distance we move (i.e. if we move 4 juntions, we must move a stack of 4 discs). If we       |'), nl,
							write('|              leave an empty junction after moving, we must place one of our cubes in that junction.        |'), nl,
							write('|                When we move to an opponent occupied position, we capture the opponent\'s stack              |'), nl,
							write('|           by placing our discs on top. When a stack is ours we can move any disc inside it, even if it     |'), nl,
							write('|               belongs to the other player! Remember a stack is ours when the top disc if ours!             |'), nl,
							write('|           If we land on a cube, it must be removed from the board and back to its owner! Good luck!        |'), nl,
							write('|                                              (Press 0 to go back)                                          |'), nl,
							write(' ____________________________________________________________________________________________________________ '), nl.


/*
 * mainMenu/0
 *
 * Displays the main menu and handles user input
 *
 */

mainMenu:- clearConsole, displayMainMenu, nl, write('What do you want to do?   : '), nl, getInputAndValidate(0, 5, UserChoice), !, \+handleChoice(UserChoice), mainMenu.


/*
 * botDifficultyMenu/0
 *
 * Displays the bot difficulty menu and handles user input
 *
 */
botDifficultyMenu(BotDiff):- clearConsole, displayBotDifficultyMenu, nl, getInputAndValidate(1, 3, BotDiff).

/*
 * bot1DifficultyMenu/0
 *
 * Displays the bot 1 difficulty menu and handles user input
 *
 */
bot1DifficultyMenu(Bot1Diff):- clearConsole, displayBot1DifficultyMenu, nl, getInputAndValidate(1, 3, Bot1Diff).

/*
 * bot2DifficultyMenu/0
 *
 * Displays the bot 2 difficulty menu and handles user input
 *
 */
bot2DifficultyMenu(Bot2Diff):- clearConsole, displayBot2DifficultyMenu, nl, getInputAndValidate(1, 3, Bot2Diff).

instructionsMenu:-	clearConsole, displayInstructions, getInputAndValidate(0, 0, _).

/*
 * handleChoice(+Choice)
 *
 * Handles the user input received in Choice, calling the right predicates, depending on the chosen menu option
 *
 */
handleChoice(0):- clearConsole, write('It''s a shame you don''t want to play anymore. Quitting...').
handleChoice(1):- write('Starting game'), nl, !, playGamePlayerVsPlayer.
handleChoice(2):- botDifficultyMenu(BotLevel), !, playGamePlayerVsComputer(BotLevel).
handleChoice(3):- botDifficultyMenu(BotLevel), !, playGameComputerVsPlayer(BotLevel).
handleChoice(4):- bot1DifficultyMenu(Bot1Level), bot2DifficultyMenu(Bot2Level), !, playGameComputerVsComputer(Bot1Level, Bot2Level).
handleChoice(5):- instructionsMenu, !,fail.

