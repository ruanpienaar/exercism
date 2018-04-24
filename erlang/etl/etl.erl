-module(etl).
-export([transform/1]).

transform(LegacyLetters) ->
    transform(LegacyLetters, []).

transform([], R) ->
    R;
transform([{Point, Letters}|T], R) ->
    transform(T, lists:foldl(fun(Letter, Acc) ->
        [{string:to_lower(Letter), Point}|Acc]
    end, R, Letters)).
