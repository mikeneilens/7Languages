-module(day1).
-export([word_count/1]).
-export([count_to_ten/0]).
-export([process_response/1]).

%Exercise 1 - n.b. a space is character 32. 
word_count(String) -> word_count(0,32,String).

%Signature is word_count(Count:Int, PreviousHead:String, RemainderOfTheList:List<String>)->Int
word_count(Count, _, [])  -> Count;
word_count(Count, 32, [32 | Tail]) -> word_count(Count, 32, Tail);
word_count(Count, 32, [Head | Tail]) -> word_count(Count + 1, Head, Tail);
word_count(Count, _, [Head | Tail]) -> 	word_count(Count , Head, Tail).

%Exercise 2
count_to_ten() -> count_to_ten(0).

count_to_ten(10)  -> "Finished";
count_to_ten(Count) -> io:fwrite(integer_to_list(Count) ++ " still counting... \n" ),  count_to_ten(Count + 1).

%exercise 3
process_response(success) -> "Success";
process_response({error, Message}) -> Message.
