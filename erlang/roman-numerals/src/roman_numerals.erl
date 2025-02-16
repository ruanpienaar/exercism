-module(roman_numerals).

-export([roman/1]).

% roman numeral splitting is:
% - 1 - 3
% - 4 ( Minus ) [1][5]
% - 5
% - 6 - 8 ( Add ) [5][x]
% - 9 ( Minus ) [1][10]
% - 10

% M - 1000
% D - 500
% C - 100
% L - 50
% X - 10
% V - 5
% I - 1

% In: 2742
% Out: ["2000", "700", "40", "2"]
%
% In; 207
% Out: ["200", "7"]

% Getting ["C","V"],
% should be ["CC","VII"]

roman(DecimalNumber) ->
    % ["2000", "700", "40", "2"]
    % ["200", "7"]
    AllNumbers = number_per_decimal(integer_to_list(DecimalNumber)),
    lists:map(
        fun([H|_] = N) ->

            % Once
            % dec_to_rom(list_to_integer(N))

            grouping(list_to_integer([H]), list_to_integer(N), N)


        end,
        AllNumbers
    ).

% number_per_decimal([]) ->
%     [];
number_per_decimal([H|[]]) ->
    [[H]];
number_per_decimal([$0|T]) ->
    number_per_decimal(T);
number_per_decimal([H|T]) ->
    [[H]++pad(length(T))|number_per_decimal(T)].

pad(X) when X =< 0 ->
    "";
pad(X) when X > 0 ->
    "0"++pad(X-1).

grouping(_X, 0, Str) ->
    "";
% (2, 2000), (2, 2)
grouping(X, _Num, _Str) when X >= 1 andalso X =< 3 ->
    % {Char, Remainder} = dec_to_rom(Num),
    % Char ++ roman(Remainder);
    lists:map(
        fun(_) ->
            dec_to_rom(X)
        end,
        lists:seq(1, X)
    );
% (4, 40)
grouping(4, Num, Str) ->
    % ok; % ( -1 ) ( 5 )
    % (1, 40) ++ (5, 40)
    % Make Num a 5 of the same amount,
    % Num=40, make 50
    % Num=400, make 500
    [H|T] = Str,
    NewStr1 = "1" ++ T,
    NewStr5 = "5" ++ T,
    grouping(1, list_to_integer(NewStr1)) ++ grouping(5, list_to_integer(NewStr5));
grouping(5, Num) ->
    io:format("Num ~p\n", [Num]),
    [dec_to_rom(Num)].
% % (7, 700)
% grouping(X, Num) when X >= 6 orelse X =< 8 ->
%     % ok; % ( 5 ) ( +X )
%     grouping(5, Num) ++
%     grouping(X-5, Num);
% grouping(9, Num) ->
%     % ok. % ( -1 ) (10)
%     grouping(1, Num) ++ grouping(10, Num);
% grouping(10, Num) ->
%     {Char, _} = dec_to_rom(Num),
%     Char.

dec_to_rom(X) when X >= 1000 ->
    "M";
dec_to_rom(X) when X >= 500 ->
    "D";
dec_to_rom(X) when X >= 100 ->
    "C";
dec_to_rom(X) when X >= 50 ->
    "L";
dec_to_rom(X) when X >= 10 ->
    "X";
dec_to_rom(X) when X >= 5 ->
    "V";
dec_to_rom(X) when X >= 1 ->
    "I".


























% roman(Number = 2742)
% roman(0) ->
%     "";
% roman([]) ->
%     "";
% roman(List) when is_list(List) ->
%     roman(list_to_integer(List));
% roman(Number) when is_integer(Number) ->
%     % "2742" = integer_to_list(Number),
%     % [H|T] = integer_to_list(Number),
%     % FNum = H="2" + pad(length(T))
%     % FNum="2000"
%     % FNum = H="7" + pad(length(T))
%     % FNum = 700
%     % "742"
%     % "42"
%     % "2"
%     %%
%     %"2"|"742"
%     [H|T] = integer_to_list(Number),
%     % 2000
%     DecToRomanNumber = list_to_integer([H]++pad(length(T))),
%     %% grouping(2, 2000)
%     Chars = grouping(list_to_integer([H]), DecToRomanNumber),
%     lists:flatten(Chars ++ roman(T)).

% pad(X) when X =< 0 ->
%     "";
% pad(X) when X > 0 ->
%     "0"++pad(X-1).

% grouping(_X, 0) ->
%     "";
% % (2, 2000), (2, 2)
% grouping(X, _Num) when X >= 1 orelse X =< 3 ->
%     % {Char, Remainder} = dec_to_rom(Num),
%     % Char ++ roman(Remainder);
%     lists:map(
%         fun(_) ->
%             {Char, _} = dec_to_rom(X),
%             Char
%         end,
%         lists:seq(1, X)
%     );
% % (4, 40)
% grouping(4, Num) ->
%     % ok; % ( -1 ) ( 5 )
%     % (1, 40) ++ (5, 40)
%     grouping(1, Num) ++ grouping(5, Num);
% grouping(5, Num) ->
%     % ok;
%     {Char, _} = dec_to_rom(Num),
%     Char;
% % (7, 700)
% grouping(X, Num) when X >= 6 orelse X =< 8 ->
%     % ok; % ( 5 ) ( +X )
%     grouping(5, Num) ++
%     grouping(X-5, Num);
% grouping(9, Num) ->
%     % ok. % ( -1 ) (10)
%     grouping(1, Num) ++ grouping(10, Num);
% grouping(10, Num) ->
%     {Char, _} = dec_to_rom(Num),
%     Char.

% dec_to_rom(X) when X >= 1000 ->
%     {"M", X - 1000};
% dec_to_rom(X) when X >= 500 ->
%     {"D", X - 500};
% dec_to_rom(X) when X >= 100 ->
%     {"C", X - 100};
% dec_to_rom(X) when X >= 50 ->
%     {"L", X - 50};
% dec_to_rom(X) when X >= 10 ->
%     {"X", X - 10};
% dec_to_rom(X) when X >= 5 ->
%     {"V", X - 5};
% dec_to_rom(X) when X >= 1 ->
%     {"I", X - 1}.


% roman numeral splitting is:
% - 1 - 3
% - 4 ( Minus )
% - 5
% - 6 - 8 ( Add )
% - 9 ( Minus )
% - 10

% M - 1000
% D - 500
% C - 100
% L - 50
% X - 10
% V - 5
% I - 1





% Ex1:
% "49"
% "4" + Pad 0's -> 40
% "9" ( nothing to pad )

% 40
% 9

% 40 -> (-10)50 -> XL
% 9 -> (-1)10 -> IX
% XLIX

% Ex2:
% 128
% 100
% 20
% 8

% 100 ( 1 - 3 grouping ), one of C.
% 20 ( 1 - 3 grouping ), two of X
% 8 ( 6 - 8 grouping ), 5 + 3 ( V(5) + 3 I (ones) ) VIII


% Ex3:

% 2742

% 2000
% 700
% 40
% 2

% 2000 ( 1 - 3 grouping ) 2 of M ( 3 places (thousand) )
% MM

% 700 ( 6-8  grouping ) 2 away from 5
%  2 ( falls in the 1-3 grouping ) 2 of 100's (CC)
% 500 ( D )
% 500 + 200 -> D+CC / DCC

% 40 ( 4 grouping 5 - 1 ), -10(X)50(L)
% XL

% 2 ( 1-3 grouping ) 2 ones(I) ( II)










% 911 = CMXI
% 1024 = M XX IV


% M XX IIII
% M XX IV


% 1 - I
% 2 - II
% 3 - III

% 4 - IV
% 5 - V
% 6 - VI
% 7 - VII
% 8 - VIII

% 9 - IX
% 10 - X


% 10 X
% 20 XX
% 30 XXX
% 40 XL

% 50 - L

% 60 LX
% 70 LXX
% 80 LXXX

% 90 XC
% 100 - C
% 110 - CX


% 10
% 21
% 44
% 50 - L
% 60 - LX
% 77 - LX
% 98 - XCVIII
% 100 - C