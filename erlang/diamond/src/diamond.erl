-module(diamond).

-include_lib("eunit/include/eunit.hrl").

-export([
    rows/1
]).

rows([LetterInt]) ->
    LetterDistance = input_letter_distance(LetterInt),
    BottomRows =
        create_rows(
            LetterDistance,
            LetterInt,
            get_height_and_width(LetterDistance)
        ),
    lists:reverse(tl(BottomRows)) ++ BottomRows.

create_rows(LetterDistance, LetterInt = $A, HeightAndWidth) ->
    [ row(LetterDistance, LetterInt, HeightAndWidth) ];
create_rows(LetterDistance, LetterInt, HeightAndWidth) ->
    [ row(LetterDistance, LetterInt, HeightAndWidth) ] ++
    create_rows(LetterDistance, LetterInt -1, HeightAndWidth).

row(_, $A, 1) ->
    "A";
row(LetterDistance, $A, _HeightAndWidth) ->
    Spaces = spaces(LetterDistance),
    lists:flatten(
        [Spaces ++ [$A] ++ Spaces]
    );
row(_LetterDistance, LetterInt, HeightAndWidth) ->
    InnerDistance = ( input_letter_distance(LetterInt) * 2 ) - 1,
    OuterDistance = abs(HeightAndWidth - (InnerDistance + 2)) div 2,
    InnerSpaces = spaces(InnerDistance),
    OutterSpaces = spaces(OuterDistance),
    lists:flatten(
        OutterSpaces ++ [LetterInt] ++ InnerSpaces ++ [LetterInt] ++ OutterSpaces
    ).

spaces(X) ->
    [ " " || _ <- lists:seq(1, X) ].

get_height_and_width(LetterDistance) ->
    ( LetterDistance * 2 ) + 1.

input_letter_distance(LetterInt)
        when LetterInt >= 65 andalso
             LetterInt =< 90 ->
    LetterInt - $A.