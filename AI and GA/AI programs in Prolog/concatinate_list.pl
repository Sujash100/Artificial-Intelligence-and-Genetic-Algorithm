conc([],L,L).
conc([X|L1],L2,[X|L3]):-
	conc(L1,L2,L3).
add(X,L,[X|L]).
/*5 ?- add(2,[1,2,3],L).*/
del(X,[Y|Tail],Tail).
del(X,[Y|Tail],[Y|Tail]):-
	del(X,Tail,Tail).
/*del(1,[1,2,3],L)*/
/*del(a,L,[1,2,3]).*/
sublist(S,L):-
	conc(L1,L2,L),conc(S,L3,L2).
/*sublist([b,c],[a,b,c,d]).*/
/*sublist([b,d],[a,b,c,d]).*/

