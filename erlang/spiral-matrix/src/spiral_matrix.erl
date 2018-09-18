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


% -define(spiral1, [[1]]).
% -define(spiral2, [[1,2],
%                   [4,3]]).
% -define(spiral3, [[1,2,3],
%                   [8,9,4],
%                   [7,6,5]]).
% -define(spiral4, [[ 1, 2, 3, 4],
%                   [12,13,14, 5],
%                   [11,16,15, 6],
%                   [10, 9, 8, 7]]).
% -define(spiral5, [[ 1,  2,  3,  4, 5],
%                   [16, 17, 18, 19, 6],
%                   [15, 24, 25, 20, 7],
%                   [14, 23, 22, 21, 8],
%                   [13, 12, 11, 10, 9]]).

% 6
% [[1,2,3,4,5,6],
%  [20,21,22,23,24,7],
%  [19,32,33,34,25,8],
%  [18,31,36,35,26,9],
%  [17,30,29,28,27,10],
%  [16,15,14,13,12,11]]

% 7
% [[1,2,3,4,5,6,7],
%  [24,25,26,27,28,29,8],
%  [23,40,41,42,43,30,9],
%  [22,39,48,49,44,31,10],
%  [21,38,47,46,45,32,11],
%  [20,37,36,35,34,33,12],
%  [19,18,17,16,15,14,13]]

% 10
% [[1,2,3,4,5,6,7,8,9,10],
%  "$%&'()*+,\v","#@ABCDEF-\f","\"?TUVWXG.\r",
%  [33,62,83,96,97,98,89,72,47,14],
%  [32,61,82,95,100,99,90,73,48,15],
%  [31,60,81,94,93,92,91,74,49,16],
%  [30,59,80,79,78,77,76,75,50,17],
%  [29,58,57,56,55,54,53,52,51,18],
%  [28,27,26,25,24,23,22,21,20,19]]

% 11
% [[1,2,3,4,5,6,7,8,9,10,11],
%  "()*+,-./01\f","'HIJKLMNO2\r",
%  [38,71,96,97,98,99,100,101,80,51,14],
%  [37,70,95,112,113,114,115,102,81,52,15],
%  [36,69,94,111,120,121,116,103,82,53,16],
%  [35,68,93,110,119,118,117,104,83,54,17],
%  [34,67,92,109,108,107,106,105,84,55,18],
%  [33,66,91,90,89,88,87,86,85,56,19],
%  [32,65,64,63,62,61,60,59,58,57,20],
%  [31,30,29,28,27,26,25,24,23,22,21]]

%What about starting from the centre, and creating the spiral outward.

% have to figure out which direction to take based on the Size.

% 2 (4)    -> Start with right , left offset 1 ( Not symmetric )
% 3 (9)    -> Start with left  , center        ( symmetric )
% 4 (16)   -> Start with right , Left offset 1 ( Not symmetric )
% 5 (25)   -> Start with left  , center        ( symmetric )
% 6 (36)   -> Start with right , center
% 7 (49)   -> Start with left  ,
% 10 (100) -> Start with right ,
% 11 (121) -> Start with left  ,

% Even numbers have equal amount of numbers on left and right

make(0) ->
    [];
make(Size) ->
    + [Size * Size].



















% make(0) ->
%     [];
% make(Size) ->
%     TupleMatrix = fill(
%         list_to_tuple(create_matrix(Size, Size, [])),
%         Size*Size, Size, r, 1, 1, 1
%     ),
%     lists:map(fun(TupleRow) ->
%         tuple_to_list(TupleRow)
%     end, tuple_to_list(TupleMatrix)).

% create_matrix(_, 0, Res) ->
%     lists:reverse(Res);
% create_matrix(Size, C, Res) ->
%     create_matrix(Size, C-1, [create_row(Size) | Res]).


% create_row(Size) ->
%     list_to_tuple([ ?PLACEHOLDER || _X <- lists:seq(1, Size) ]).

% fill(M, Max, Size, D=r, X, Y, Total)  when X > Size ->
%     {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
%     fill(M, Max, Size, NextDir, NewX, NewY, Total);
% fill(M, Max, Size, D=d, X, Y, Total)  when Y > Size ->
%     {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
%     fill(M, Max, Size, NextDir, NewX, NewY, Total);
% fill(M, Max, Size, D=l, X, Y, Total)  when X == 0 ->
%     {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
%     fill(M, Max, Size, NextDir, NewX, NewY, Total);
% fill(M, Max, Size, D=u, X, Y, Total)  when Y == 0 ->
%     {NextDir, NewX, NewY} = next_direction_adjust_x_y(D, X, Y),
%     fill(M, Max, Size, NextDir, NewX, NewY, Total);
% fill(M, Max, Size, D, X, Y, Total) ->
%     case check_pos(M, D, X, Y) of
%         ok ->
%             NewM = set_x_y(M, X, Y, Total),
%             case Total == Max of
%                 true ->
%                     NewM;
%                 false ->
%                     {NextX, NextY} = next_x_y(D, X, Y),
%                     fill(NewM, Max, Size, D, NextX, NextY, Total+1)
%             end;
%         {NextDir, RewindX, RewindY} ->
%             fill(M, Max, Size, NextDir, RewindX, RewindY, Total)
%     end.

% check_pos(M, D, X, Y) ->
%     Row = element(Y, M),
%     Cell = element(X, Row),
%     case Cell of
%         ?PLACEHOLDER ->
%             ok;
%         _ ->
%             rewind_x_y(D, X, Y)
%     end.

% set_x_y(M, X, Y, Total) ->
%     Row = element(Y, M),
%     % set cell
%     UpdatedRow = erlang:setelement(X, Row, Total),
%     % Update matrix with updated row
%     erlang:setelement(Y, M, UpdatedRow).

% next_dir(r) ->
%     d;
% next_dir(d) ->
%     l;
% next_dir(l) ->
%     u;
% next_dir(u) ->
%     r.

% next_direction_adjust_x_y(D = r, X, Y) ->
%     {next_dir(D), X-1, Y+1};
% next_direction_adjust_x_y(D = d, X, Y) ->
%     {next_dir(D), X-1, Y-1};
% next_direction_adjust_x_y(D = l, X, Y) ->
%     {next_dir(D), X+1, Y-1};
% next_direction_adjust_x_y(D = u, X, Y) ->
%     {next_dir(D), X+1, Y+1}.

% rewind_x_y(D = r, X, Y) ->
%     {next_dir(D), X-1, Y+1};
% rewind_x_y(D = d, X, Y) ->
%     {next_dir(D), X-1, Y-1};
% rewind_x_y(D = l, X, Y) ->
%     {next_dir(D), X+1, Y-1};
% rewind_x_y(D = u, X, Y) ->
%     {next_dir(D), X + 1, Y + 1}.

% next_x_y(r, X, Y) ->
%     {X+1, Y};
% next_x_y(d, X, Y) ->
%     {X, Y+1};
% next_x_y(l, X, Y) ->
%     {X-1, Y};
% next_x_y(u, X, Y) ->
%     {X, Y-1}.

test_version() -> 1.
