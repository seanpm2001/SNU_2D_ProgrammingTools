 perfect(N) :-
     between(1, inf, N), U is N // 2,
     findall(D, (between(1,U,D), N mod D =:= 0), Ds),
     sumlist(Ds, N).
