-module(spiral_matrix).

-export([
    make/1,
    test_version/0,
    create_row/1
]).

-ifdef(TEST).
-export([
    set_x_y/4,
    check_pos/4
]).
-endif.

-define(PLACEHOLDER, x).

make(0) ->
    [];
make(Size) ->
    TupleMatrix = fill(
        list_to_tuple(create_matrix(Size, Size, [])),
        Size*Size, Size, r, 1, 1, 1
    ),
    lists:map(fun(TupleRow) ->
        tuple_to_list(TupleRow)
    end, tuple_to_list(TupleMatrix)).

create_matrix(_, 0, Res) ->
    lists:reverse(Res);
create_matrix(Size, C, Res) ->
    create_matrix(Size, C-1, [create_row(Size) | Res]).


create_row(Size) ->
    list_to_tuple([ ?PLACEHOLDER || _X <- lists:seq(1, Size) ]).

fill(M, Max, Size, D=r, X, Y, Total)  when X > Size ->
    {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
    fill(M, Max, Size, NextDir, NewX, NewY, Total);
fill(M, Max, Size, D=d, X, Y, Total)  when Y > Size ->
    {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
    fill(M, Max, Size, NextDir, NewX, NewY, Total);
fill(M, Max, Size, D=l, X, Y, Total)  when X == 0 ->
    {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
    fill(M, Max, Size, NextDir, NewX, NewY, Total);
fill(M, Max, Size, D=u, X, Y, Total)  when Y == 0 ->
    {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
    fill(M, Max, Size, NextDir, NewX, NewY, Total);
fill(M, Max, Size, D, X, Y, Total) ->
    case check_pos(M, D, X, Y) of
        ok ->
            NewM = set_x_y(M, X, Y, Total),
            case Total == Max of
                true ->
                    NewM;
                false ->
                    {NextX, NextY} = next_x_y(D, X, Y),
                    fill(NewM, Max, Size, D, NextX, NextY, Total+1)
            end;
        {NextDir, RewindX, RewindY} ->
            fill(M, Max, Size, NextDir, RewindX, RewindY, Total)
    end.

check_pos(M, D, X, Y) ->
    Row = element(Y, M),
    Cell = element(X, Row),
    case Cell of
        ?PLACEHOLDER ->
            ok;
        _ ->
            rewind_x_y(D, X, Y)
    end.

set_x_y(M, X, Y, Total) ->
    Row = element(Y, M),
    % set cell
    UpdatedRow = erlang:setelement(X, Row, Total),
    % Update matrix with updated row
    erlang:setelement(Y, M, UpdatedRow).

next_dir(r) ->
    d;
next_dir(d) ->
    l;
next_dir(l) ->
    u;
next_dir(u) ->
    r.

next_direction_adjust_x_y(D = r, X, Y) ->
    {next_dir(D), X-1, Y+1};
next_direction_adjust_x_y(D = d, X, Y) ->
    {next_dir(D), X-1, Y-1};
next_direction_adjust_x_y(D = l, X, Y) ->
    {next_dir(D), X+1, Y-1};
next_direction_adjust_x_y(D = u, X, Y) ->
    {next_dir(D), X+1, Y+1}.

rewind_x_y(D = r, X, Y) ->
    {next_dir(D), X-1, Y+1};
rewind_x_y(D = d, X, Y) ->
    {next_dir(D), X-1, Y-1};
rewind_x_y(D = l, X, Y) ->
    {next_dir(D), X+1, Y-1};
rewind_x_y(D = u, X, Y) ->
    {next_dir(D), X + 1, Y + 1}.

next_x_y(r, X, Y) ->
    {X+1, Y};
next_x_y(d, X, Y) ->
    {X, Y+1};
next_x_y(l, X, Y) ->
    {X-1, Y};
next_x_y(u, X, Y) ->
    {X, Y-1}.

test_version() -> 1.
