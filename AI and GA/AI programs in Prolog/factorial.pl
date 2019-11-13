factorial(1,1).
factorial(N,R):-
	N>1,N1 is N-1,factorial(N1,R1),R is N*R1.
/*factorial(6,E).*/
