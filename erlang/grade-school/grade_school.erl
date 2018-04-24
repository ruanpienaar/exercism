-module(grade_school).
-export([
    new/0,
    add/3,
    get/2,
    sort/1
]).

new() ->
    [].

add(Name, Grade, Grades) ->
    [{Grade, Name}|Grades].

get(Grade, Grades) ->
    proplists:get_all_values(Grade, Grades).

sort(Grades) ->
    GradeLvl = lists:sort(proplists:get_keys(Grades)),
    [ {Grade, get(Grade, Grades)} || Grade <- GradeLvl ].