member(X,[X|L]):-!.
member(X,[Y|L]):-member(X,L).
/*member(X,[a,b,c]).*/
