s(s,a).
s(s,b).
s(s,c).
s(a,d).
s(c,d).
goal(d).
solve(Start,Solution):-bfs([[Start]],Solution).
bfs([[Node|Path]|_],[Node|Path]):-goal(Node).
bfs([Path|Paths],Solution):-
extend(Path,NewPath),
	conc(Paths,NewPath,Path1),
	bfs(Path1,Solution).
extend([Node|Path],NewPath) :-
	bagof( [NewNode,Node|Path],
	       ( s(Node,NewNode),not(member(NewNode,[Node|Path]))),
NewPath),!.
extend(Path,[]).
conc([],L,L).
conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).
member(X,[X|L]).
member(X,[H|T]):-member(X,T).
/*solve(start,D). */
