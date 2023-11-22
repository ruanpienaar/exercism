-module(prime_factors).

-export([factors/1]).

factors(Value) -> 
	factors(Value, next_prime_to_use(undefined), []).

factors(1, _PrimeToUse, PrimeFactors) ->
	PrimeFactors;
factors(Value, PrimeToUse, PrimeFactors) ->
	% logger:notice(" factors ~p ~p ~p \n", [Value, PrimeToUse, PrimeFactors]),
	case Value rem PrimeToUse of 
		0 ->
			NewValue = Value div PrimeToUse,
			factors(NewValue, PrimeToUse, [ PrimeToUse | PrimeFactors ]);
		N when N =/= 0 ->
			factors(Value, next_prime_to_use(PrimeToUse), PrimeFactors)
	end.

next_prime_to_use(undefined) ->
	2;
next_prime_to_use(X) ->
	NextNum = X+1,
	case is_prime(NextNum) of 
		true ->
			NextNum;
		false ->
			next_prime_to_use(NextNum)
	end.

is_prime(N) ->
    is_prime(N, 2, erlang:trunc(math:sqrt(N)) + 1).

is_prime(_, Max, Max) ->
    true;
is_prime(N, I, Max) ->
	case N rem I =:= 0 of 
		true ->
			false;
		false ->
			is_prime(N, I+1, Max)
	end.