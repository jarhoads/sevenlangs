-module(translate_service).
-export([loop/0,translate/1]).

loop() ->

	receive
		{From, "casa"} ->
			From ! "house",
			loop();

		{From, "blanca"} ->
			From ! "white",
			loop();

		{_,finish} ->
			io:format("Finished translating.~n"),
			exit({translate_service,die,at,erlang:time()});

		{From, _} ->
			From ! "I don't understand",
			loop()
	end.

translate(Word) -> translate(translator,Word).
translate(To,Word) ->
	To ! {self(),Word},
	receive
		Translation -> Translation
	after 5000 ->
		timeout
	end.

