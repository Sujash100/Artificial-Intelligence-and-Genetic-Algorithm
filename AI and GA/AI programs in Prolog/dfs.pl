s(s,a).
s(s,b).
s(s,c).
s(a,d).
s(c,d).
goal(d).
solve(Node,Solution):-dfs([],Node,Solution).
dfs(Path,Node,[Node|Path]):-goal(Node).
dfs(Path,Node,Solution):-
s(Node,Node1),not(member(Node1,Path)),dfs([Node|Path],Node1,Solution).
member(X,[X|L]).
member(X,[H|L]):-member(X,L).
/*solve(source node/starting node,P).*/
