-module(first_class).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%%%
%%% Code goes here...
%%%

square_list(L) ->
    do_list(L,[],fun square/1).

square(X) ->
    X * X.

do_list([],Out,_F) ->
    reverse(Out);
do_list([Element|Remaining],Out,F) ->
    do_list(Remaining,[F(Element)|Out],F).
    
reverse(L) ->
    reverse(L,[]).

reverse([],Out) ->
    Out;
reverse([Element|Remaining],Out) ->
    reverse(Remaining,[Element|Out]).

%%%
%%%
%%%

-ifdef(EUNIT).

square_test_() ->
    [
     ?_assertEqual(1,square(1)),
     ?_assertEqual(4,square(2)),
     ?_assertEqual(9,square(3)),
     ?_assertEqual(16,square(4))
    ].

square_list_test_() ->
    [
     ?_assertEqual([1],square_list([1])),
     ?_assertEqual([4],square_list([2])),
     ?_assertEqual([1,4],square_list([1,2])),
     ?_assertEqual([1,4,9,16],square_list([1,2,3,4]))
    ].

reverse_test_() ->
    [
     ?_assertEqual([1],reverse([1])),
     ?_assertEqual([2,1],reverse([1,2])),
     ?_assertEqual([3,2,1],reverse([1,2,3]))
    ].

-endif.
