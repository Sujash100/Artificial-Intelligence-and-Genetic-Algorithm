addleaf(nil,X,+(nil,X,nil)).
addleaf(t(L,X,R),X,+(L,X,R)).
addleaf(t(L,Root,R),X,+(L1,Root,R)):-
	Root>X,addleaf(L,X,L1).
addleaf(t(L,Root,R),X,t(L,Root,R1)):-
	X>Root,addleaf(R,X,R1).
/*addleaf(t(t(nil,1,nil),3,t(nil,4,nil)),5,P).*/
