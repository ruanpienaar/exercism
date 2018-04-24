-module(word_count).
-export([count/1]).

count(String) ->
    Toks = string:tokens(String, " "
        ++lists:flatten([ [X] || X <-
            %% Ignore punctuation and other non alphanum
            lists:seq(27,47)++
            lists:seq(58,64)++
            lists:seq(91,96)++
            lists:seq(123,255)
    ])),
    dict:from_list(find_words(Toks, [])).

find_words([], WordCountPropList) ->
    WordCountPropList;
find_words([H|T], WordCountPropList) ->
    Word=string:to_lower(H),
    find_words(T, case lists:keyfind(Word, 1, WordCountPropList) of
        false ->
            [{Word,1}|WordCountPropList];
        {Word, Count} ->
            lists:keyreplace(Word, 1, WordCountPropList, {Word, Count+1})
    end).