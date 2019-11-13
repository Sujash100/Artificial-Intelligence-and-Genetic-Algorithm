gcd(X,X,X).
gcd(X,Y,R):-
	X<Y,Y1 is Y-X,gcd(X,Y1,R).
gcd(X,Y,R):-
	X>Y,gcd(Y,X,R).

/*gcd(8,2,R).*/
/*gcd with zero*/
gcd(0,R,R).
gcd(X,Y,R):-
	X=<Y,Y1 is Y mod X,gcd(Y1,X,R).
gcd(X,Y,R):-X>Y,gcd(Y,X,R).
/*gcd(0,2,R).*/
