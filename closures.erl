-module(closures).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([generate_adder/1,use_adder/2]).

%%%
%%% Code goes here...
%%%

generate_adder(B) ->
    fun(X) ->
	    X + B
    end.

%%%
%%% Pretend these are a long way away from each other...
%%%

use_adder(F,A) ->
    F(A).

%%%
%%%
%%%

-ifdef(EUNIT).

generator_test_() ->
    {"generator returns a function",?_assert(is_function(generate_adder(0)))}.

adder_test_() ->
    [
     ?_assertEqual(2,use_adder(generate_adder(1),1)),
     ?_assertEqual(42,use_adder(generate_adder(27),15))
    ].

-endif.
