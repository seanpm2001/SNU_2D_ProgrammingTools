solve(true, 1) :- !.
solve((Subgoal1,Subgoal2), Certainty) :-
    !,
    solve(Subgoal1, Certainty1),
    solve(Subgoal2, Certainty2),
    Certainty is min(Certainty1, Certainty2).
solve(Goal, 1) :-
    builtin(Goal), !, 
    Goal.
solve(Head, Certainty) :-
    clause_cf(Head, Body, Certainty1),
    solve(Body, Certainty2),
    Certainty is Certainty1 * Certainty2.

