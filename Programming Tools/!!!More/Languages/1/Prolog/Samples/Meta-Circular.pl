solve(true).
solve((Subgoal1,Subgoal2)) :- 
    solve(Subgoal1),
    solve(Subgoal2).
solve(Head) :- 
    clause(Head, Body),
    solve(Body).
