-module(armstrong_numbers).

-export([is_armstrong_number/1]).

%% @doc
%%    Check whether number is a valid Armstrong number.
%%    true  -> 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
%%    false -> 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190
%% @end
-spec is_armstrong_number(integer()) -> boolean().
is_armstrong_number(Number) ->
    Digits = erlang:integer_to_list(Number),
    Length = length(Digits),
    lists:foldl(
        fun(Digit, Acc) ->
            round(
                math:pow(
                    erlang:list_to_integer([Digit]),
                    Length
                )
            ) + Acc
        end,
        0,
        Digits
    ) =:= Number.