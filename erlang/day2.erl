-module(day2).
-export([find_value/2]).
-export([get_total_price/1]).
-export([has_won_tictactoe/1]).


%Exercise 1  
find_value([], _) -> "key not found";
find_value([{Keyword,Value}|_], Keyword) -> Value;
find_value([_|Remainder], Keyword) -> find_value(Remainder, Keyword);
find_value(_, _) -> "first parameter must be a list".

%Exercise 2
get_total_price(ShoppingList) ->
[{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

%Exercise 3 - b is a blank square
has_won_tictactoe({X,X,X,_,_,_,_,_,_}) when X /= b -> X;
has_won_tictactoe({_,_,_,X,X,X,_,_,_}) when X /= b -> X;
has_won_tictactoe({_,_,_,_,_,_,X,X,X}) when X /= b -> X;
has_won_tictactoe({X,_,_,X,_,_,X,_,_}) when X /= b -> X;
has_won_tictactoe({_,X,_,_,X,_,_,X,_}) when X /= b -> X;
has_won_tictactoe({_,_,X,_,_,X,_,_,X}) when X /= b -> X;
has_won_tictactoe({X,_,_,_,X,_,_,_,X}) when X /= b -> X;
has_won_tictactoe({_,_,X,_,X,_,X,_,_}) when X /= b -> X;

has_won_tictactoe(T) -> 

	ContainsBlanks = lists:any(fun(X) -> X == b end, tuple_to_list(T) ),
	if 
		ContainsBlanks -> "No winner yet";
		true -> "No more moves left"
	end	
.
