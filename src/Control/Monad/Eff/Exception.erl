-module(control_monad_eff_exception@foreign).
-export([showErrorImpl/1,error/1,message/1,stackImpl/3,throwException/1,catchException/2]).

showErrorImpl(E) -> E.

error(S) -> S.

message(E) -> E.

stackImpl(Just,Nothing,E) -> Nothing.

throwException(E) -> fun() ->
  erlang:error(E)
end.

catchException(C,T) -> fun () ->
  try T()
  catch error:Reason -> (C(Reason))()
  end
end.
