factorial(0, 1).

factorial(N, F) :- N > 0, N1 is N - 1,
                   factorial(N1, F1),
                   F is N * F1.


fib(0,0).
fib(1,1).
fib(N,T):-N>1,N1 is N-1,N2 is N-2,fib(N1,F1),fib(N2,F2),T is F1+F2.



 
sum(A, B, C):- 
	C is A + B.



max(X, Y, M):- X > Y, M is X, !.
max(X, Y, M):- Y >= X, M is Y.



power(_, 0, 1).
power(Num, Pow, Ans):-
	Num>0,
	N1 is Num-1,
	power(Num,N1,J),
	Ans is Num*J.


memb(X, [X | Tail]).
memb(X, [Head | Tail]):-
  memb(X, Tail).


conc([], L, L).
conc([X | L1], L2, [X | L3]):-
  conc(L1, L2, L3).


reverse([], []).
reverse([Head|Tail], R):-
  reverse(Tail, L1),
  conc(L1, [Head], R).



palindrome([]):- !.
palindrome([_]):- !.
palindrome(L):-
  conc([Head|Tail], [Head], L),
  palindrome(Tail), !.



sumList([], 0).
sumList([Head|Tail], S):-
  sumList(Tail, X),
  S is Head + X.


evenlength([]):- !.
evenlength([_|T]):- oddlength(T).

oddlength([_]):- !.
oddlength([_|T]):- evenlength(T).




nth_element(1, [H|_], H):- !.
nth_element(N, [_|T], X):-
	N > 0,
	N1 is N - 1,
	nth_element(N1, T, X).


max(X, Y, M):- X > Y, M is X, !.
max(X, Y, M):- Y >= X, M is Y.

maxlist([H], H):- !.
maxlist([H|T], M):-
	maxlist(T, M1),
	max(H, M1, M).






gcd(0, A, A):- !.
gcd(A, 0, A):- !.
gcd(A, B, C):-
	B1 is mod(A, B),
	gcd(B, B1, C).


multiply(0,_,0):-
multiply(_,0,0):-
multiply(X,1,X):-
multiply(1,Y,Y):-
multiply(X,Y,Res):-
	X>0, Y>0,
	X1 is X-1,
	multiply(X1,Y,t),
	Res is t + Y.



16.
insert_nth(I, 1, L, [I|L]):- !.

insert_nth(I, N, [H|T], [H|T1]):-
  N1 is N - 1,
  insert_nth(I, N1, T, T1).



17.
delete_nth(1, [H|T], T):- !.
delete_nth(N, [H|T], [H|T1]):-
  N1 is N - 1,
  delete_nth(N1, T, T1).


18.
merge([H1|T1], [H2|T2], [H1|T]):-
  H1 < H2, !,
  merge(T1, [H2|T2], T).

merge([H1|T1], [H2|T2], [H2|T]):-
  merge([H1|T1], T2, T), !.

merge(L1, [], L1):- !.
merge([], L2, L2).



19.
delete_ao(_, [], []).
  
delete_ao(X, [X|T], Result) :- delete_ao(X, T, Result).
 
delete_ao(X, [H|T], [H|Result]) :-
    X \= H,
    delete_ao(X, T, Result).

20.
remove_duplicates([], []).

remove_duplicates([X | Tail], Result) :-memb(X, Tail), remove_duplicates(Tail, Result).

remove_duplicates([X | Tail], [X | Result]) :-remove_duplicates(Tail, Result).


21.
sentence(a,c):-nounPhrase(a,b),verbPhrase(b,c).
nounPhrase(a,c):-article(a,b),noun(b,c).
nounPhrase(a,b):-noun(a,b).
verbPhrase(a,b):-verb(a,b).
verbPhrase(a,c):-verb(a,b),nounPhrase(b,c).
verbPhrase(a,c):-verb(a,b),prepositionPhrase(b,c).
prepositionPhrase(a,c):-preposition(a,b),nounPhrase(b,c).
