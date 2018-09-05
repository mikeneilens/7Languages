twice([], []).
twice([Head|Tail], [Head,Head|Tail1]) :-  twice(Tail,Tail1).