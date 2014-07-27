takeout(X,[X|R],R).
takeout(X,[F|R],[F|T]) :- takeout(X,R,T).

% this is similar to bubble sort
bubble_sort([],L,L).
bubble_sort(InList,TempList,SortedList):-
	smallest(InList,S),
	takeout(S,InList,Diff),
	append(TempList,[S],N),
	bubble_sort(Diff,N,SortedList).

sort_list(L,Srt):- bubble_sort(L,[],Srt).