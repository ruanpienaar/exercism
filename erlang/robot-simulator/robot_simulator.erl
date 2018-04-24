-module(robot_simulator).
-export([
    create/0,
    direction/1,
    position/1,
    place/3,
    left/1, turn_left/1,
    right/1, turn_right/1,
    advance/1,
    control/2
]).

create() ->
    spawn(fun() -> robot_loop({{undefined,undefined},undefined}) end).

direction(Robot) ->
    requestor(Robot, direction).

position(Robot) ->
    requestor(Robot, position).

place(Robot, Direction, Cor2) ->
    requestor(Robot, {place, {Cor2, Direction}}).

left(Robot) ->
    requestor(Robot, turn_left).

right(Robot) ->
    requestor(Robot, turn_right).

advance(Robot) ->
    requestor(Robot, advance).

control(Robot, AdvanceString) ->
    requestor(Robot, {control, AdvanceString}).

requestor(Robot, Req) ->
    Robot ! {req, self(), Req},
    receive Any -> Any end.

robot_loop({Coordinate, Direction}) ->
    receive
        {req, ReqPid, direction} ->
            ReqPid ! Direction,
            robot_loop({Coordinate, Direction});
        {req, ReqPid, position} ->
            ReqPid ! Coordinate,
            robot_loop({Coordinate, Direction});
        {req, ReqPid, {place,{NewCoordinate, NewDirection}}} ->
            ReqPid ! ok,
            robot_loop({NewCoordinate, NewDirection});
        {req, ReqPid, D} when D == turn_left; D == turn_right ->
            NewDirection = ?MODULE:D(Direction),
            ReqPid ! NewDirection,
            robot_loop({Coordinate, NewDirection});
        {req, ReqPid, advance} ->
            ReqPid ! ok,
            robot_loop(move({Coordinate, Direction}));
        {req, ReqPid, {control, AdvanceString}} ->
            ReqPid ! ok,
            robot_loop(control_string_move(AdvanceString, {Coordinate, Direction}))
    end.

turn_left(north) -> west;
turn_left(east)  -> north;
turn_left(south) -> east;
turn_left(west)  -> south.

turn_right(north) -> east;
turn_right(east)  -> south;
turn_right(south) -> west;
turn_right(west)  -> north.

move({{X, Y}, D=north}) -> {{X, Y+1}, D};
move({{X, Y}, D=east}) -> {{X+1, Y}, D};
move({{X, Y}, D=south}) -> {{X, Y-1}, D};
move({{X, Y}, D=west}) -> {{X-1, Y}, D}.

control_string_move([], {Coordinate, Direction}) ->
    {Coordinate, Direction};
control_string_move([$L|T], {Coordinate, Direction}) ->
    control_string_move(T, {Coordinate, turn_left(Direction)});
control_string_move([$R|T], {Coordinate, Direction}) ->
    control_string_move(T, {Coordinate, turn_right(Direction)});
control_string_move([$A|T], {Coordinate, Direction}) ->
    control_string_move(T, move({Coordinate, Direction}));
control_string_move([H|T], {Coordinate, Direction}) ->
    control_string_move(T, {Coordinate, Direction}).
