insert(X,L,[X|L]).
insert(X,[Y|L],[Y|L1]):-
	insert(X,L,L1).

/*insert(a,[1,2,3],P).*/
