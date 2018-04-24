-module(binary_string_tests).
-include_lib("eunit/include/eunit.hrl").


one_test() -> check(1, "1").

two_test() -> check(2, "10").

three_test() -> check(3, "11").

four_test() -> check(4, "100").

nine_test() -> check(9, "1001").

twenty_six_test() -> check(26, "11010").

large_test() -> check(1128, "10001101000").

carrot_test() -> ?assert(0 =:= binary_string:to_decimal( "carrot" )).

% check( String ) ->
%   ?assert(binary_string:to_decimal( String ) =:= erlang:list_to_integer( String, 2 )).

% my example below, actually prints you the expected value, and what your code produced.
% a simpler way to see what's going wrong :)
% ( for instance, i was returning floats, which didn't match! cause =:= )
check( Expect, BinString ) ->
  ?assertEqual(Expect, binary_string:to_decimal( BinString )).
