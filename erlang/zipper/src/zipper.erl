-module(zipper).
-export([
  new_tree/3,
  empty/0,
  from_tree/1,
  to_tree/1,
  value/1,
  left/1,
  right/1,
  up/1,
  set_value/2,
  test_version/0
]).

new_tree(V, L, R) ->
    % lists:flatten([L] ++ [V] ++ [R]).
    [L] ++ [V] ++ [R].

empty() ->
    nil.

from_tree([H|T]) ->
    H.

to_tree(X) ->
    new_tree(X, empty(), empty()).

value([_L, V, _R]) ->
    V.

left([L, _V, _R]) ->
    L.

right([_L, _V, R]) ->
    R.

up([L, V, R]) ->
    [Lup, Vup, Rup] = V.

set_value(X, Y) ->
    ok.

test_version() ->
    1.
