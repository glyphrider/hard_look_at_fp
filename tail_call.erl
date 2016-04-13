-module(tail_call).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%%%
%%% Code goes here....
%%%

fibonacci(N) ->
    fibonacci(0,1,N).

fibonacci(CurrentValue,_LastValue,1) ->
    CurrentValue;
fibonacci(CurrentValue,LastValue,N) ->
    fibonacci(CurrentValue+LastValue,CurrentValue,N-1).

bad_fib(1) ->
    0;
bad_fib(2) ->
    1;
bad_fib(N) ->
    bad_fib(N-1) + bad_fib(N-2).

%%%
%%%
%%%

-ifdef(EUNIT).

fibonacci_test_() ->
    [
     %% some basic fibonacci tests (for the first 8 numbers)
     ?_assertEqual(0,fibonacci(1)),
     ?_assertEqual(1,fibonacci(2)),
     ?_assertEqual(1,fibonacci(3)),
     ?_assertEqual(2,fibonacci(4)),
     ?_assertEqual(3,fibonacci(5)),
     ?_assertEqual(5,fibonacci(6)),
     ?_assertEqual(8,fibonacci(7)),
     ?_assertEqual(13,fibonacci(8)),

     %% calculate the first 40 fibonacci numbers with both algorithms and
     %% confirm both answers are the same
     %% note the huge growth in time once you get above fibonacci(35)
     lists:map(fun(X) ->
		       {lists:flatten(io_lib:format("naive and tail-call are equal at ~p",[X])),
			?_assertEqual(bad_fib(X),fibonacci(X))}
	       end,lists:seq(1,40)),
     %% confirm that the tail-call version can calculate the first 1000
     %% fibonacci numbers, each in less than 2ms
     lists:map(fun(X) ->
		       {lists:flatten(io_lib:format("tail-call is fast at ~p",[X])),
			fun() ->
				{Time,_Result} = timer:tc(fun fibonacci/1,[X]),
				?assert(Time < 2000) % runs in under 2 ms
			end}
	       end,lists:seq(1,1000))
    ].

-endif.
