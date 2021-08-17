maplist(_, [], []).
maplist(P, [X|Xs], [Y|Ys]) :-
   call(P, X, Y),
   maplist(P, Xs, Ys).
