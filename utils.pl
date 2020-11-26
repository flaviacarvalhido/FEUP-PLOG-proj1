:- use_module(library(lists)).
:- use_module(library(between)).

test_get:- get_matrix_value(2, 1, [[1, 2, 3], [4, 5, 6], [7, 8, 9]], Res).
testRefill:- refillList([b, b, w, b, b, e], List), printList(List).
testRemove:- removeFromList(3, [1, 2, 3, 4, 5, 6], NewList), printList(NewList).

/*
 * getMatrixValue(+Nrow, +Ncol,+Matrix, -Res)
 *
 * Returns in Res the value of the matrix at row Nrow and column Ncol
 *
 */
getMatrixValue(NRow, NCol, Matrix, Res):- nth0(NRow, Matrix, Row),
											nth0(NCol, Row, Res).

/*
 * getTopPiece(+Cell, -Piece)
 *
 * Returns in Piece the first piece of the received Cell
 *
 */
getTopPiece([H|_], H).

/*
 * getNumPiecesInCell(+Cell, +Acc, -Result)
 *
 * Returns in Result the number of pieces in the received Cell
 * (Acc should be an empty list when calling this predicate)
 *
 */
getNumPiecesInCell([H|T], Acc, Result):- 
	H \= e, !, 
	AccNew is Acc+1, 
	getNumPiecesInCell(T, AccNew, Result).
getNumPiecesInCell(_, Acc, Acc):- !.

/*
 * getDistance(+X1, +Y1, +X2, +Y2, -Distance)
 *
 * Returns in Distance the distance between coordinates(X1, Y1) and (X2, Y2)
 *
 */
getDistance(X1, Y1, X2, Y2, Distance):- 
	X1 =:= X2, !, 
	Distance is abs(Y1-Y2).
getDistance(X1, Y1, X2, Y2, Distance):- 
	Distance is abs(X1-X2).

/*
 * addToList(+ListToAdd, +TargetList, -NewList)
 *
 * Adds ListToAdd to the beginning of TargetList and returns the resulting list in NewList
 *
 */
addToList(ListToAdd, TargetList, NewList):- 
	append(ListToAdd, TargetList, NewList).

/*
 * getInputAndValidate(+Low, +High, -Input)
 *
 * Asks the user for input and then verifies if it is in the interval [Low, High]
 *
 */
getInputAndValidate(Low, High, Input):- get Input asking 'Your choice: ',
										between(Low, High, Input).

/*
 * replaceInRow(+Row, +IndexToReplace, +ValueToReplace, -NewRow)
 *
 * Replaces the value at IndexToReplace index in Row with ValueToReplace. The resulting list is returned in NewRow.
 *
 */
replaceInRow([_|Tail], 0, ValueToReplace, [ValueToReplace|Tail]).
replaceInRow([Head|Tail], IndexToReplace, ValueToReplace, [Head|NewTail]) :-
	IndexToReplace > 0,
	NewIndexToReplace is IndexToReplace - 1,
	replaceInRow(Tail, NewIndexToReplace, ValueToReplace, NewTail).

/*
 * replaceInBoard(+Board, +Row, +Column, +ValueToReplace, -NewBoard)
 *
 * Replaces the value at row Row and column Column in the matrix Board with ValueToReplace. The resulting matrix is returned in NewBoard.
 *
 */
replaceInBoard([Head|Tail], 0, Column, ValueToReplace, [NewHead|Tail]) :-
        replaceInRow(Head, Column, ValueToReplace, NewHead).
replaceInBoard([Head|Tail], Row, Column, ValueToReplace, [Head|NewTail]) :-
	Row > 0,
	NewRow is Row - 1,
	replaceInBoard(Tail, NewRow, Column, ValueToReplace, NewTail).

/*
 * replace(+Board, +Row, +Column, +ValueToReplace, -NewBoard)
 *
 * Replaces the value at index RowIndex of the cell located at row Row and column Column of the Board with ValueToReplace. The resulting board is returned in NewBoard.
 *
 */
replace([Head|Tail], 0, Row, Column, Value, [NewHead|Tail]):- 
	replaceInBoard(Head, Row, Column, Value, NewHead).
replace([Head|Tail], RowIndex, Row, Column, Value, [Head|NewTail]):-    
	RowIndex > 0,
	RowIndexNew is RowIndex - 1,
	replace(Tail, RowIndexNew, Row, Column, Value, NewTail).

/*
 * removeFromListEnd(+NumberToRemove, +List, -NewList)
 *
 * Removes NumberToRemove elements from the end of List.
 *
 */
removeFromListEnd(NumberToRemove, List, NewList):- reverse(List, RevList), removeFirstNElements(NumberToRemove, RevList, TempRevList), reverse(TempRevList, NewList).

/*
 * buildListToAdd(+Length, +List, -FinalList)
 *
 * Builds a list with Length e atoms, representing empty spaces.
 * (List should be an empty list when calling this predicate)
 *
 */
buildListToAdd(0, List, List):-!.
buildListToAdd(Length, List, FinalList):- 	Length > 0, LengthNew is Length-1, 
											buildListToAdd(LengthNew, [e|List], FinalList).

/*
 * refillList(+List, -FinalList)
 *
 * Refills List with empty spaces ('e') until it has length 12.
 *
 */
refillList(List, FinalList):- length(List, Len), LenToAdd is 12-Len, buildListToAdd(LenToAdd, [], ListToAdd), append(List, ListToAdd, FinalList).

/*
 * getFirstNElements(+N, +List, +Acc, -Elements)
 *
 * Returns in Elements the first N elements of List.
 * (Acc should be an empty list when calling this predicate)
 *
 */
getFirstNElements(0, _, Acc, Elements):- reverse(Acc, Elements).
getFirstNElements(N, [Head|Tail], Acc, Elements):-  N > 0, N1 is N-1,
												getFirstNElements(N1, Tail, [Head|Acc], Elements).

/*
 * removeFirstNElements(+N, +List, -FinalList)
 *
 * Removes the first N elements from List and returns the resulting list in FinalList.
 *
 */
removeFirstNElements(0, List, List):-!.
removeFirstNElements(N, List, FinalList):- N > 0, N1 is N-1,
										removeFirstElement(List, NewList),
										removeFirstNElements(N1, NewList, FinalList).

/*
 * removeFirstElement(+List, -ResultingList)
 *
 * Removes the first element from List and returns the resulting list in ResultingList.
 *
 */
removeFirstElement([Head|Tail], Tail).

/*
 * decomposeState(+GameState, -Board, -WhiteCubes, -BlackCubes)
 *
 * Decomposes GameState (list with three elements) into Board (first element), WhiteCubes (third element) and BlackCubes (second element).
 *
 */
decomposeState(GameState, Board, WhiteCubes, BlackCubes):- nth0(0, GameState, Board), nth0(2, GameState, WhiteCubes), nth0(1, GameState, BlackCubes).

/*
 * printList(+List)
 *
 * Prints the elements of the list List
 * (Debug predicate)
 *
 */
printList([]):-!.
printList([Head|Tail]):- 
	write(Head), 
	printList(Tail).

/*
 * printListOfList(+ListOfList)
 *
 * Prints the elements of a list of lists ListOfList
 * (Debug predicate)
 *
 */
printListOfList([]):-!.
printListOfList([Head|Tail]):- printList(Head), write('  '), printListOfList(Tail).

/*
 * 
 * Input operators
 *
 */
:- op(800, xfx, asking).
:- op(900, fx, get).

/*
 * Reads input into Answer. Before reading displays a message Question.
 *
 */
get Answer asking Question :-
	write(Question), write(' '), nl,
	read(Answer).

/*
 * clearConsole/0
 *
 * Clears the Sicstus console.
 *
 */
clearConsole :- write('\33\[2J').