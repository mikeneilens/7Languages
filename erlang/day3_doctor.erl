-module(day3_doctor).
-export([loop/0, monitor/0]).

loop() -> 
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("Creating and monitoring process. ~n"),
			register(revolver, spawn_link(fun roulette:loop/0)),
			loop();
		suicide -> 
			io:format("I just killed myself! ~n"),
			exit("Suicide is painless!");	
		{'EXIT', From, Reason} ->
			io:format("The shooter ~p died with reason ~p . ",[From, Reason]),
			self() ! new,
			loop()
	end.

monitor() ->
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("Creating a new doctor. ~n"),
			register(doctor, spawn_link(fun loop/0)),
			doctor ! new,				
			monitor();	
		{'EXIT', From, Reason} ->
				io:format("The doctor ~p just died with reason ~p ~n",[From,Reason]),
				self() ! new,
				monitor()
	end.

	% Doctor = spawn(fun day3_doctor:monitor/0).
	% Doctor ! new.
	% revolver ! 1. -- does nothing.
	% revolver ! 3. -- kills the revolver, which restarts.
	% doctor ! suicide -- kills the doctor loop.