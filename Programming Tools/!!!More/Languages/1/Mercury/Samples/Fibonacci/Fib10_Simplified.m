 main(IO0, IO) :-
        io.write_string("fib(10) = ", IO0, IO1),
        io.write_int(fib(10), IO1, IO2),
        io.nl(IO2, IO).
