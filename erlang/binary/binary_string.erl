-module(binary_string).
-export([to_decimal/1]).

to_decimal(Bin) ->
    erlang:round(process(valid_bin(Bin), Bin)).

process(false, _) ->
    0.0;
process(true, []) ->
    0.0;
process(true, L=[H|[]]) ->
    list_to_integer([H]);
process(true, L=[$0|T]) ->
    0.0 + process(true, T);
process(true, L=[$1|T]) ->
    math:pow(2, length(L)-1) + process(true, T).

valid_bin([]) ->
    true;
valid_bin([H|T]) when H == $0; H == $1 ->
    valid_bin(T);
valid_bin([H|T]) ->
    false.
