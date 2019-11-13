insertionsort([X],[X]).
insertionsort([X|L1],L2):-insertionsort(L1,L3),inserts(X,L3,L2).
inserts(X,[],[X]).
inserts(X,[Y|L1],[X,Y|L1]):-X=<Y.
inserts(X,[Y|L1],[Y|L2]):-X>Y,inserts(X,L1,L2).
/* insertionsort([3,4,2,5],L)*/
