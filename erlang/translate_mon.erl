-module(translate_mon).
-export([mon/0]).

mon() ->

	process_flag(trap_exit,true),

	receive
		new -> 
			io:format("Creating and monitoring new translate service.~n"),
			register(translator,spawn_link(fun translate_service:loop/0)),
			mon();

		{'EXIT',From,Reason} ->
			io:format("The translation ~p exited with reason ~p.~n",[From,Reason]),
			io:format("Restarting translation service.~n"),
			self() ! new,
			mon()
	end.

