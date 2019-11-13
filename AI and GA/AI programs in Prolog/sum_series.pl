series(0,0).
series(1,1).
series(N,R):-N>1,N1 is N-1,series(N1,R1),R is N+R1.
/*series(3,P).*/

/*using iterative method*/
series(1,1).
series(N,R):-
	N>1,add(N,0,R).
add(0,R,R).
add(N,T,R):-
	N>0,T1 is N+T,N1 is N-1,add(N1,T1,R).

