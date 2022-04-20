-module(raindrops).

-export([convert/1]).


convert(Number) when is_integer(Number) ->
    case pling(Number rem 3)++plang(Number rem 5)++plong(Number rem 7) of
        "" ->
            integer_to_list(Number);
        RainSpeak ->
            RainSpeak
    end.

pling(0) ->
    "Pling";
pling(_) ->
    "".

plang(0) ->
    "Plang";
plang(_) ->
    "".

plong(0) ->
    "Plong";
plong(_) ->
    "".
