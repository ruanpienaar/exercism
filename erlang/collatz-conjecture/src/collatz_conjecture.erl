-module(collatz_conjecture).

-export([
    test_version/0,
    steps/1
]).

test_version() -> 2.

-spec steps(pos_integer()) -> non_neg_integer().
steps(Num) when Num =< 0 ->
    {error, "Only positive numbers are allowed"};
steps(Num) when is_integer(Num) ->
    run_steps(Num, 0).

run_steps(1, Count) ->
    Count;
run_steps(Num, Count) ->
    case Num rem 2==0 of
        true ->
            run_steps(Num div 2, Count+1);
        false ->
            run_steps((Num*3)+1, Count+1)
    end.
