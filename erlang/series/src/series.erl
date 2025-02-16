-module(series).

-export([slices/2]).

slices(SliceLength, Series) when SliceLength > length(Series) ->
    erlang:error(badarg);
slices(SliceLength, _Series) when SliceLength =< 0 ->
    erlang:error(badarg);
slices(SliceLength, Series) ->
    get_slices(1, SliceLength, Series, []).

% [lists:nth(1, "1234")] ++ [lists:nth(2, "1234")].
% lists:map(fun(P) -> get_char(CharPos, Series) end, lists:seq(Start, End))
get_slices(Pos, SliceLength, Series, R) when SliceLength+(Pos-1) > length(Series) ->
    lists:reverse(R);
get_slices(Pos, SliceLength, Series, R) ->
    get_slices(
        Pos+1,
        SliceLength,
        Series,
        [
            lists:reverse(
                lists:foldl(
                    fun(P, A) -> [ get_char(P, Series) | A ] end,
                    [],
                    lists:seq(Pos, SliceLength+(Pos-1))
                )
            )
            | R
        ]
    ).

% %% [lists:nth(1, "1234")]
get_char(CharPos, Series) ->
    lists:nth(CharPos, Series).