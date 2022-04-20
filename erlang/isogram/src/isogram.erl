%% @doc
%%   Determine if a word or phrase is an isogram.
%%   An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.
%%   Examples of isograms:
%%   lumberjacks
%%   background
%%   downstream
%%   six-year-old
%%   The word isograms, however, is not an isogram, because the s repeats.
%% @end

-module(isogram).

-export([
    is_isogram/1,
    test_version/0
]).

%% @doc
%%    is_isogram takes in a list of characters ( aka string ) and returns a boolean
%%    value that indicates whether a string passes the isogram criteria.
%% @end
is_isogram(String) ->
    is_isogram(String, []).

is_isogram([], _) ->
    true;
is_isogram([ H | T ], R) when
        H =:= $  orelse
        H =:= $- ->
    is_isogram(T, R);
is_isogram([ H | T ], R) ->
    LH = string:to_lower(H),
    case lists:member(LH, R) of
        true ->
            false;
        false ->
            is_isogram(T, [ LH | R ])
    end.

test_version() ->
    1.
