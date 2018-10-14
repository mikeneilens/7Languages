-module(day1).
-export([word_count/1]).
-export([count_to_ten/0]).
-export([process_response/1]).

%Exercise 1
word_count(String) -> word_count(0,32,String).

word_count(Count, _, String) when String == [] -> Count;
word_count(Count, LastChar, String) -> 
	[Head | Tail] = String,
	case LastChar  of
		32  when Head /= 32 -> 
			word_count(Count + 1, Head, Tail);
		_ -> 
			word_count(Count, Head, Tail)
	end.	

%Exercise 2
count_to_ten() -> count_to_ten(0).

count_to_ten(Count) when Count == 10 -> "Finished";
count_to_ten(Count) -> count_to_ten(Count + 1).

%exercise 3
process_response(Response) -> 
	case Response of 
		success -> 
			"Success";
		{error, Message} ->
			Message
	end.
