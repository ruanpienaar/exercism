-module(diamond).

-include_lib("eunit/include/eunit.hrl").

-export([
    rows/1
]).

rows([LetterInt]) ->
    LetterDistance = input_letter_distance(LetterInt),
    HeightAndWidth = get_height_and_width(LetterDistance),
    create_rows(
        LetterDistance,
        LetterInt,
        starting_letter(),
        HeightAndWidth,
        HeightAndWidth,
        false
    ).

starting_letter() ->
    $A.

create_rows(_, _, _, 0, _, _) ->
    [];
create_rows(LetterDistance, LetterInt, CurrentLetterInt, HW, HeightAndWidth, Middle) when HW > 0 ->
    [row(LetterDistance, LetterInt, CurrentLetterInt, HeightAndWidth)] ++
        create_rows(LetterDistance,
            LetterInt,
            forwards_or_backwards(Middle, CurrentLetterInt),
            HW - 1,
            HeightAndWidth,
            middle(Middle, LetterInt, CurrentLetterInt + 1)
        ).

middle(true, _, _) ->
    true;
middle(false, X, X) ->
    true;
middle(_, _, _) ->
    false.

forwards_or_backwards(false, CurrentLetterInt) ->
    CurrentLetterInt + 1;
forwards_or_backwards(true, CurrentLetterInt) ->
    CurrentLetterInt - 1.

row(_, _LetterInt, $A, 1) ->
    "A";
row(LetterDistance, _LetterInt, $A, _HeightAndWidth) ->
    Spaces = [" " || _ <- lists:seq(1, LetterDistance)],
    lists:flatten(
        [Spaces ++ [$A] ++ Spaces]
    );
row(_LetterDistance, _LetterInt, CurrentLetterInt, HeightAndWidth) ->
    InnerDistance = ( input_letter_distance(CurrentLetterInt) * 2 ) - 1,
    OuterDistance = abs(HeightAndWidth - (InnerDistance + 2)) div 2, %% +2 for each symmetric character
    InnerSpaces = [ " " || _ <- lists:seq(1, InnerDistance) ],
    OutterSpaces = [ " " || _ <- lists:seq(1, OuterDistance) ],
    lists:flatten(
        OutterSpaces ++ [CurrentLetterInt] ++ InnerSpaces ++ [CurrentLetterInt] ++ OutterSpaces
    ).

get_height_and_width(LetterDistance) ->
    (LetterDistance * 2)+1.

input_letter_distance(LetterInt) when LetterInt >= 65 andalso LetterInt =< 90 ->
    LetterInt - $A.