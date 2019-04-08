-module(darts).

-export([score/2]).


score(0, 0) ->
    10;
score(X, Y) -> 
    case math:sqrt(math:pow(X, 2) + math:pow(Y, 2)) of
        Rad when Rad =< 5.0 ->
            5;
        Rad when Rad >= 5.0 andalso Rad =< 10.0 ->
            1;
        _ ->
            0
    end.

% point system
% 0
% 1
% 5
% 10

% radiuses
% 10
% 5
% 1
% 0 

% Circle
% X(2) + Y(2) = R(2)
