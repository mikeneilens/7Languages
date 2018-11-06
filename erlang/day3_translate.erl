-module(day3_translate).
-export([loop/0, translate/2, monitor/0]).

loop() ->
	receive 
		{From,"casa"} ->
			From ! "house",
			loop();
		{From, "blanca"} ->
			From ! "white",
			loop();
		{From, "suicidio"} ->
			From ! "I just killed myself",
			exit("Bye, bye!");
		{From, _} -> 
			From ! "I don't understand ",
			loop()
	end.

	translate(To, Word) -> 
		To ! {self(), Word}, 
		receive 
			Translation -> Translation
		end.

	monitor() ->
		process_flag(trap_exit, true),
		receive
			new ->
				io:format("Creating a new translator. ~n"),
				register(translator, spawn_link(fun loop/0)),
				monitor();
			{'EXIT', From, Reason} ->
				io:format("The translator ~p just died with reason ~p",[From,Reason]),
				self() ! new,
				monitor()
		end.

		% Translator = spawn(fun day3_translate:monitor/0).
		% Translate ! new.
		% translator ! "casa". -- should return "house"
		% translator ! "suicidio" -- should kill the translator and monitor create a new one.