-module(diamond).
-export([rows/1]).
-define(ALPHA, "ABCDEFGHIGKLMNOPQRSTUVWXYZ").
rows(Letter) ->
    Letters = hd(string:split(?ALPHA, Letter)) ++ Letter,
    Rows = lists:map(fun make_row/1, Letters),
    Rows ++ tl(lists:reverse(Rows)).
make_row(Letter) ->
    case string:str(?ALPHA, [Letter]) -1 of
        0 -> [Letter];
        Spaces -> [Letter] ++ string:copies(".", Spaces) ++ [Letter]
    end.