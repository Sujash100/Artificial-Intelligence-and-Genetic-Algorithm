ordered([]).
ordered([_]).
ordered([X,Y|T]):-
	X=<Y,ordered([Y|T]).
/*ordered([1,2,3]).*/

