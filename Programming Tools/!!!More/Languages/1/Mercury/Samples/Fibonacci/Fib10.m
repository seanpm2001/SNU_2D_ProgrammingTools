 :- module fib.
 :- interface.
 :- import_module io.
 :- pred main(io::di, io::uo) is det.
 
 :- implementation.
 :- import_module int.

 :- func fib(int) = int.
 fib(N) = (if N =< 2 then 1 else fib(N - 1) + fib(N - 2)).

 main(!IO) :-
        io.write_string("fib(10) = ", !IO),
        io.write_int(fib(10), !IO),
        io.nl(!IO).
        % Could instead use io.format("fib(10) = %d\n", [i(fib(10))], !IO).
