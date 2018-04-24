-module(atbash_cipher).
-export([
    encode/1,
    decode/1,
    test_version/0
]).

test_version() ->
    1.

encode(Str) ->
    convert(0, string:to_lower(Str)).

decode(Str) ->
    convert(decode, string:to_lower(Str)).

convert(_, Str=[]) ->
    Str;
convert(decode, [H|T]) when ((H >= $a) and (H =< $z)) orelse
                            ((H >= $0) and (H =< $9)) ->
    [flip(H) | convert(decode, T)];
convert(C, [H|T]) when ((H >= $a) and (H =< $z)) orelse
                       ((H >= $0) and (H =< $9)) ->
    case is_factor_of(C, 5) of
        true ->
            [ $  |
            [flip(H) | convert(C+1, T)]
            ];
        false ->
            [flip(H) | convert(C+1, T)]
    end;
convert(C, [_H|T]) ->
    convert(C, T).

flip(H) when ((H >= $a) and (H =< $z)) ->
    $z - (H - $a);
flip(H) when ((H >= $0) and (H =< $9)) ->
    H.

is_factor_of(0, _) ->
    false;
is_factor_of(C, FactorOf) ->
    C rem FactorOf == 0.