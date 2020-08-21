%% The module declaration must match the file name "series.erl" 
-module(series).

%% The export statement contains a list of all those functions that form
%% the module's public API.  In this case, this module exposes a single
%% function called fib that takes 1 argument (I.E. has an arity of 1)
%% The general syntax for -export is a list containing the name and
%% arity of each public function
-export([fib/1]).

%% ---------------------------------------------------------------------
%% Public API
%% ---------------------------------------------------------------------

%% Handle cases in which fib/1 receives specific values
%% The order in which these function signatures are declared is a vital
%% part of this module's functionality

%% If fib/1 is passed precisely the integer 0, then return 0
fib(0) -> 0;

%% If fib/1 receives a negative number, then return the atom err_neg_val
%% Normally, such defensive coding is discouraged due to Erlang's 'Let
%% it Crash' philosophy; however, in this case we should explicitly
%% prevent a situation that will crash Erlang's runtime engine
fib(N) when N < 0 -> err_neg_val;

%% If fib/1 is passed an integer less than 3, then return 1
%% The preceding two function signatures handle all cases where N < 1,
%% so this function signature handles cases where N = 1 or N = 2
fib(N) when N < 3 -> 1;

%% For all other values, call the private function fib_int/3 to perform
%% the calculation
fib(N) -> fib_int(N, 0, 1).

%% ---------------------------------------------------------------------
%% Private API
%% ---------------------------------------------------------------------

%% If fib_int/3 receives a 1 as its first argument, then we're done, so
%% return the value in argument B.  Since we are not interested in the
%% value of the second argument, we denote this using _ to indicate a
%% "don't care" value
fib_int(1, _, B) -> B;

%% For all other argument combinations, recursively call fib_int/3
%% where each call does the following:
%%  - decrement counter N
%%  - Take the previous fibonacci value in argument B and pass it as
%%    argument A
%%  - Calculate the value of the current fibonacci number and pass it
%%    as argument B
fib_int(N, A, B) -> fib_int(N-1, B, A+B).
