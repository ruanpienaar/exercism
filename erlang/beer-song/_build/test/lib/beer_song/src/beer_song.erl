-module(beer_song).
-export([
    verse/1,
    sing/1,
    sing/2
]).

-export([test_version/0]).

test_version() ->
  1.

verse(0) ->
    "No more bottles of beer on the wall, no more bottles of beer.\n"
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
verse(Num) ->
    io_lib:format("~p bottle~s of beer on the wall, ~p bottle~s of beer.\n~s",
                  [Num, multiple(Num), Num, multiple(Num), second_verse_part(Num-1)]).

second_verse_part(0) ->
    "Take it down and pass it around, no more bottles of beer on the wall.\n";
second_verse_part(X) ->
    io_lib:format("Take one down and pass it around, ~p bottle~s of beer on the wall.\n",
                  [X, multiple(X)]).

multiple(1) -> "";
multiple(_) -> "s".

sing(Start) ->
    do_sing(lists:reverse(lists:seq(1,Start))++[0]).

sing(Start, End) ->
    do_sing(lists:reverse(lists:seq(End,Start))).

do_sing(L) ->
    [ verse(X)++"\n" || X <- L ].