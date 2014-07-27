reverse_list([],R,R).
reverse_list([Head|Tail], Accum, Reversed):-
	reverse_list(Tail, [Head|Accum], Reversed).

rev(L,Rev):- reverse_list(L,[],Rev).