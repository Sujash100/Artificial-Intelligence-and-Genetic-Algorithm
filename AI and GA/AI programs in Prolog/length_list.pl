len([],0).
len([_|T],N):-
	len(T,N1),N is 1+N1.
/*len([a],M).*/
