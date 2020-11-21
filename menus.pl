
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
					write('|                                    0 - Quit                                                                |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write('|                                                                                                            |'), nl,
					write(' ____________________________________________________________________________________________________________ '), nl.


mainMenu:- clearConsole, displayMainMenu, nl, write('What do you want to do?   : '), read(UserChoice), handleChoice(UserChoice).


handleChoice(0):- write('It''s a shame you don''t want to play anymore. Quitting...').
handleChoice(1):- !.
handleChoice(2):- !.
handleChoice(3):- !.
handleChoice(4):- !.