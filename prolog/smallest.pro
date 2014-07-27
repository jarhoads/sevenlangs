find_smallest([],L,L).
find_smallest([Head|Rest],Temp,Smallest):-
	Head < Temp,
	find_smallest(Rest,Head,Smallest).
find_smallest([Head|Rest],Temp,Smallest):-
	Head >= Temp,
	find_smallest(Rest,Temp,Smallest).

smallest([H|R],S):- find_smallest(R,H,S).