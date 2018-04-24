-module(phone).
-export([number/1,
         areacode/1,
	 pretty_print/1]).

-define(BAD_NUM, "0000000000").

number(N) when is_list(N) ->
    N2 = clean_number(N, []),
    check_number(N2).

check_number([$1|R]=N) when length(N) == 11 ->
    R;
check_number(N) when length(N) == 10 ->
    N;
check_number(N) ->
    ?BAD_NUM.
    
clean_number([], R) ->
    lists:reverse(R);
clean_number([H|T], R) when H >= 48, H =< 57 ->
    clean_number(T, [H|R]);
clean_number([H|T], R) ->
    clean_number(T, R).

areacode(N) ->
    {AreaCode,_} = split(number(N)),
    AreaCode.
	
pretty_print(N) ->
    {AreaCode, Rest} = split(number(N)),
    {Rest1, Rest2} = split(Rest),
    lists:flatten(io_lib:format("(~s) ~s-~s", [AreaCode,Rest1,Rest2])).
    
split(N) when length(N) >= 3 ->
    lists:split(3, N).