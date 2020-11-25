:- use_module(library(lists)).
:- use_module(library(between)).

test_get:- 
        get_matrix_value(2, 1, [[1, 2, 3], [4, 5, 6], [7, 8, 9]], Res).

getMatrixValue(NRow, NCol, Matrix, Res):- nth0(NRow, Matrix, Row),
											nth0(NCol, Row, Res).

getTopPiece([H|_], H).

getNumPiecesInCell([H|T], Acc, Result):- 
	H \= e, !, 
	AccNew is Acc+1, 
	getNumPiecesInCell(T, AccNew, Result).

getNumPiecesInCell(_, Acc, Acc):- !.

getDistance(X1, Y1, X2, Y2, Distance):- 
	X1 =:= X2, !, 
	Distance is abs(Y1-Y2).

getDistance(X1, Y1, X2, Y2, Distance):- 
	Distance is abs(X1-X2).

addToList(ListToAdd, TargetList, NewList):- 
	append(ListToAdd, TargetList, NewList).

getInputAndValidate(Low, High, Input):- get Input asking 'Your choice: ',
										between(Low, High, Input).
%getInputAndValidate(Low, High, Input):- write('Invalid Choice, please insert again.'), nl, getInputAndValidate(Low, High, Input).

replaceInList([_|Tail], 0, ValueToReplace, [ValueToReplace|Tail]).
replaceInList([Head|Tail], IndexToReplace, ValueToReplace, [Head|NewTail]) :-
	IndexToReplace > 0,
	NewIndexToReplace is IndexToReplace - 1,
	replaceInList(Tail, NewIndexToReplace, ValueToReplace, NewTail).

replaceInMatrix([Head|Tail], 0, Column, ValueToReplace, [NewHead|Tail]) :-
        replaceInList(Head, Column, ValueToReplace, NewHead).
replaceInMatrix([Head|Tail], Row, Column, ValueToReplace, [Head|NewTail]) :-
	Row > 0,
	NewRow is Row - 1,
	replaceInMatrix(Tail, NewRow, Column, ValueToReplace, NewTail).


replace([H|T], 0, Row, Column, Value, [HNew|T]):- 
	replaceInMatrix(H, Row, Column, Value, HNew).
replace([H|T], RowR, Row, Column, Value, [H|TNew]):-    
	RowR > 0,
	RowR1 is RowR - 1,
	replace(T, RowR1, Row, Column, Value, TNew).


removeFromListEnd(NumberToRemove, List, NewList):- reverse(List, RevList), removeFirstNElements(NumberToRemove, RevList, TempRevList), reverse(TempRevList, NewList).

buildListToAdd(0, List, List):-!.
buildListToAdd(Length, List, FinalList):- Length > 0, LengthNew is Length-1, 
											buildListToAdd(LengthNew, [e|List], FinalList).

refillList(List, FinalList):- length(List, Len), LenToAdd is 12-Len, buildListToAdd(LenToAdd, [], ListToAdd), append(List, ListToAdd, FinalList).

getFirstNElements(0, _, Acc, Elements):- reverse(Acc, Elements).
getFirstNElements(N, [Head|Tail], Acc, Elements):-  N > 0, N1 is N-1,
												getFirstNElements(N1, Tail, [Head|Acc], Elements).

removeFirstNElements(0, List, List):-!.
removeFirstNElements(N, List, FinalList):- N > 0, N1 is N-1,
										removeFirstElement(List, NewList),
										removeFirstNElements(N1, NewList, FinalList).

removeFirstElement([Head|Tail], Tail).

testRefill:- refillList([b, b, w, b, b, e], List), printList(List).
testRemove:- removeFromList(3, [1, 2, 3, 4, 5, 6], NewList), printList(NewList).

decomposeState(GameState, Board, WhiteCubes, BlackCubes):- nth0(0, GameState, Board), nth0(2, GameState, WhiteCubes), nth0(1, GameState, BlackCubes).


printList([]):-!.
printList([Head|Tail]):- 
	write(Head), 
	printList(Tail).

printListOfList([]):-!.
printListOfList([Head|Tail]):- printList(Head), write('  '), printListOfList(Tail).

:- op(800, xfx, asking).
:- op(900, fx, get).

get Answer asking Question :-
	write(Question), write(' '), nl,
	read(Answer).

clearConsole :- write('\33\[2J').