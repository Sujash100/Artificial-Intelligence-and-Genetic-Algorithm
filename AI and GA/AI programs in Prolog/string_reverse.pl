reverse([X],[X]).
reverse([X|L1],L2):-
	reverse(L1,L3),cone(L3,[X],L2).
cone([],L,L).
cone([X|L1],L2,[X|L3]):-
	cone(L1,L2,L3).

/*reverse([1,2,3],L1).*/
/*using shift method*/
reverse([X|L1],L2):-
	conc(L1,[X],L2).
conc([],L,L).
conc([X|L1],L2,[X|L3]):-
	conc(L1,L2,L3).
