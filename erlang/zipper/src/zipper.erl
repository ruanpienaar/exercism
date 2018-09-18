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
  set_left/2,
  set_right/2,
  set_value/2,
  test_version/0
]).

%% TODO:

%% 2 data structures needed
%% Rose tree
%% Zipper

new_tree(V, L, R) ->
    [V, L, R].

empty() ->
    nil.

from_tree([V, L, R]) ->
    [V, L, R].

to_tree(V) ->
    % new_tree(V, empty(), empty()).
    V.

value([V, _L, _R]) ->
    V.

left(nil) ->
    nil;
left([V, L, _R]) ->
    L.

right(nil) ->
    nil;
right([_V, _L, R]) ->
    R.

up(nil) ->
    nil;
up([V, _L, _R]) ->
    V.

set_left(NL, [V, _L, R]) ->
    [V, NL, R].

set_right(NR, [V, L, _R]) ->
    [V, L, NR].

set_value([_V, L, R], NV) ->
    [NV, L, R].

test_version() ->
    1.
