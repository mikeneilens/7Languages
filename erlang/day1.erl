-module(day1).
-export([word_count/1]).

word_count(String) -> word_count2(0,32,String).

word_count2(Count, _, String) when String == [] -> Count;
word_count2(Count, LastChar, String) -> 
	[Head | Tail] = String,
	case LastChar  of
		32  when Head /= 32 -> 
			word_count2(Count + 1, Head, Tail);
		_ -> 
			word_count2(Count, Head, Tail)
	end.	

