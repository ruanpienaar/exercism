-module(circular_buffer).
-export([ create/1,
          read/1,
          size/1,
          write/2,
          write_attempt/2
]).

-export([test_version/0]).

test_version() ->
  1.
%% Making an assumption that 8bits/Byte will be enough per element/block in buffer.
create(Size) ->
    spawn(fun() ->
        cbuff(Size, 0, 0, << <<X>> || <<X:8>> <= <<0:(8*Size)>> >>)
    end).

read(Pid) ->
    req(Pid,read).

size(Pid) ->
    req(Pid,size).

write(Pid,Val) ->
    req(Pid,{write,Val}).

write_attempt(Pid,Val) ->
    req(Pid,{write_attempt,Val}).

cbuff(Size,RPos,WPos,Buff) ->
    receive
        {request,From,size} ->
            reply(From,{ok,Size}),
            cbuff(Size,RPos,WPos,Buff);
        {request,From,read} ->
            {Val,NewBuff,NewRPos}=do_read(Size,RPos,Buff),
            reply(From,Val),
            cbuff(Size,NewRPos,WPos,NewBuff);
        {request,From,{write, Val}} ->
            {Reply,NewBuff,NewWPos}=do_write(Size,WPos,Val,Buff),
            reply(From, Reply),
            cbuff(Size,RPos,NewWPos,NewBuff);
        {request,From,{write_attempt,Val}} ->
            {Reply,NewBuff,NewWPos}=do_write_attempt(Size,WPos,Val,Buff),
            reply(From,Reply),
            cbuff(Size,RPos,NewWPos,NewBuff)
        % ( sys:get_state(Pid) )
        % {system, From, _Msg = get_state} ->
        %     gen:reply(From, {Size,RPos,WPos,Buff}),
        %     cbuff(Size,RPos,WPos,Buff)
    end.

req(Pid, Req) ->
    Pid ! {request,self(),Req},
    receive
        {reply,Reply} ->
            Reply
        after
            500 ->
                {error,timeout}
    end.

reply(Pid,Reply) ->
    Pid ! {reply,Reply}.

do_read(Size,Pos,Buff) ->
    % io:format("do_read(~p)~n", [[Size,Pos,Buff]]),
    case do_read_attempt(Pos,Buff) of
        0 ->
            {{error,empty},Buff,Pos};
        V ->
            {{ok,V},new_buffer(Size,Buff,Pos,0),next_pos(Size,Pos)}
    end.

do_read_attempt(Pos,Buff) ->
    binary:at(Buff,Pos).

do_write(Size,Pos,Val,Buff) ->
    {ok,new_buffer(Size,Buff,Pos,Val),next_pos(Size,Pos)}.

do_write_attempt(Size,Pos,Val,Buff) ->
    case do_read_attempt(Pos,Buff) of
        0 ->
            do_write(Size,Pos,Val,Buff);
        V ->
            {{error,full},Buff,Pos}
    end.

next_pos(Size,Pos) when (Pos+1) == Size ->
    0;
next_pos(Size,Pos) when Pos < Size ->
    Pos+1.

new_buffer(1,Buff,0,NewVal) ->
    <<NewVal:8>>;
new_buffer(Size, Buff, 0, NewVal) ->
    Tail = binary:part(Buff, 1, Size-1),
    <<NewVal:8, Tail/binary>>;
new_buffer(Size, Buff, Pos, NewVal) when (Pos+1) =:= Size ->
    Head = binary:part(Buff, 0, Size-1),
    <<Head/binary, NewVal:8>>;
new_buffer(Size, Buff, Pos, NewVal) ->
    Head = binary:part(Buff, 0, Pos),
    Tail = binary:part(Buff, Pos+1, (Size-1)-Pos),
    <<Head/binary, NewVal:8, Tail/binary>>.