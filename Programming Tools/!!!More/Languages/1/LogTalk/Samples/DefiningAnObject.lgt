:- object(my_first_object).

    :- initialization((write('Hello world'), nl)).

    :- public(p1/0).
    p1 :- write('This is a public predicate'), nl.

    :- private(p2/0).
    p2 :- write('This is a private predicate'), nl.

:- end_object.
