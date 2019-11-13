insert(X,L,[X|L]).
insert(X,[Y|L],[Y|L1]):-
	insert(X,L,L1).
permut([X],[X]).
permut([X|L],P):-
	permut(L,LP),insert(X,LP,P).
/*permut([1,2,3],L1).*/
