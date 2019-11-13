max_min(N1,N2,Max,Min):-
	N1>N2,Max is N1,Min is N2.
max_min(N1,N2,Max,Min):-
	N1<N2,Max is N2,Min is N1.
