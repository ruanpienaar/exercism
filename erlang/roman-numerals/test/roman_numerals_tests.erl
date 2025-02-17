%% Generated with 'testgen v0.2.0'
%% Revision 1 of the exercises generator was used
%% https://github.com/exercism/problem-specifications/raw/b820099d9cb3518c7c3326f913eb6515a7067a5a/exercises/roman-numerals/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(roman_numerals_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_convert_1_test_'() ->
    {"1 is I", ?_assertEqual("I", roman_numerals:roman(1))}.

'2_convert_2_test_'() ->
    {"2 is II",
     ?_assertEqual("II", roman_numerals:roman(2))}.

'3_convert_3_test_'() ->
    {"3 is III",
     ?_assertEqual("III", roman_numerals:roman(3))}.

'4_convert_4_test_'() ->
    {"4 is IV",
     ?_assertEqual("IV", roman_numerals:roman(4))}.

'5_convert_5_test_'() ->
    {"5 is V", ?_assertEqual("V", roman_numerals:roman(5))}.

'6_convert_6_test_'() ->
    {"6 is VI",
     ?_assertEqual("VI", roman_numerals:roman(6))}.

'7_convert_9_test_'() ->
    {"9 is IX",
     ?_assertEqual("IX", roman_numerals:roman(9))}.

'8_convert_27_test_'() ->
    {"27 is XXVII",
     ?_assertEqual("XXVII", roman_numerals:roman(27))}.

'9_convert_48_test_'() ->
    {"48 is XLVIII",
     ?_assertEqual("XLVIII", roman_numerals:roman(48))}.

'10_convert_49_test_'() ->
    {"49 is XLIX",
     ?_assertEqual("XLIX", roman_numerals:roman(49))}.

'11_convert_59_test_'() ->
    {"59 is LIX",
     ?_assertEqual("LIX", roman_numerals:roman(59))}.

'12_convert_93_test_'() ->
    {"93 is XCIII",
     ?_assertEqual("XCIII", roman_numerals:roman(93))}.

'13_convert_141_test_'() ->
    {"141 is CXLI",
     ?_assertEqual("CXLI", roman_numerals:roman(141))}.

'14_convert_163_test_'() ->
    {"163 is CLXIII",
     ?_assertEqual("CLXIII", roman_numerals:roman(163))}.

'15_convert_402_test_'() ->
    {"402 is CDII",
     ?_assertEqual("CDII", roman_numerals:roman(402))}.

'16_convert_575_test_'() ->
    {"575 is DLXXV",
     ?_assertEqual("DLXXV", roman_numerals:roman(575))}.

'17_convert_911_test_'() ->
    {"911 is CMXI",
     ?_assertEqual("CMXI", roman_numerals:roman(911))}.

'18_convert_1024_test_'() ->
    {"1024 is MXXIV",
     ?_assertEqual("MXXIV", roman_numerals:roman(1024))}.

'19_convert_3000_test_'() ->
    {"3000 is MMM",
     ?_assertEqual("MMM", roman_numerals:roman(3000))}.

'20_convert_16_test_'() ->
    {"16 is XVI",
     ?_assertEqual("XVI", roman_numerals:roman(16))}.

'21_convert_66_test_'() ->
    {"66 is LXVI",
     ?_assertEqual("LXVI", roman_numerals:roman(66))}.

'22_convert_166_test_'() ->
    {"166 is CLXVI",
     ?_assertEqual("CLXVI", roman_numerals:roman(166))}.

'23_convert_666_test_'() ->
    {"666 is DCLXVI",
     ?_assertEqual("DCLXVI", roman_numerals:roman(666))}.

'24_convert_1666_test_'() ->
    {"1666 is MDCLXVI",
     ?_assertEqual("MDCLXVI", roman_numerals:roman(1666))}.

'99_convert_1666_test_'() ->
    {"99 is XCIX",
     ?_assertEqual("XCIX", roman_numerals:roman(99))}.
