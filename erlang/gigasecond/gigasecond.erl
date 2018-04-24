-module(gigasecond).
-export([
    from/1
]).

from(DateTime={{_Year, _Month, _Day},{_Hh,_Mm,_Ss}}) ->
    calc(calendar:datetime_to_gregorian_seconds(DateTime));
from(Date={_Year, _Month, _Day}) ->
    calc(calendar:datetime_to_gregorian_seconds({Date, {0,0,0}})).

calc(BirthSeconds) ->
    calendar:gregorian_seconds_to_datetime(trunc(math:pow(10, 9))+BirthSeconds).