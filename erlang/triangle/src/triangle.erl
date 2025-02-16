-module(triangle).

-export([kind/3]).

kind(A, B, C) when
        A =< 0 orelse
        B =< 0 orelse
        C =< 0 ->
    {error, "all side lengths must be positive"};
kind(A, A, A) ->
    equilateral;
kind(A, B, C) ->
    case check_side_sums(A, B, C) of
        true ->
            case check_for_isosceles(A, B, C) of
                isosceles ->
                    isosceles;
                false ->
                    scalene
            end;
        false ->
            { error , "side lengths violate triangle inequality" }
    end.

check_side_sums(A, B, C)
        when (A+B) >= C andalso (C+B) >= A andalso (A+C) >= B ->
    true;
check_side_sums(_A, _B, _C) ->
    false.

check_for_isosceles(A, A, _B) ->
    isosceles;
check_for_isosceles(_B, A, A) ->
    isosceles;
check_for_isosceles(A, _B, A) ->
    isosceles;
check_for_isosceles(_, _, _) ->
    false.