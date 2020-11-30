:-include('gameplay/play_game.pl').
:-use_module(library(lists)).
:-use_module(library(system)).

% starting point predicate
play:- 	mainMenu ; true.
