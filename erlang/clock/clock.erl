-module('clock').

-export([
    create/2,
    is_equal/2,
    minutes_add/2,
    to_string/1
]).

create(H, M) when H >= 24 -> create(H-24, M);
create(H, M) when H < 0   -> create(H+24, M);
create(H, M) when M >= 60 -> create(H+1, M-60);
create(H, M) when M < 0   -> create(H-1, M+60);
create(H, M)              -> {H, M}.

is_equal({H1,M1}, {H2,M2}) ->
    create(H1,M1)==create(H2,M2).

minutes_add({H,M}, Minutes) -> create(H, M+Minutes).

to_string({H_in,M_in}) ->
    {H,M}=create(H_in,M_in),
    lists:flatten(
        io_lib:format("~s~p:~s~p",[pad(H),H,pad(M),M])
    ).

pad(X) when X < 10 -> "0";
pad(X)             -> "".