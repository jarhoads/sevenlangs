map([],P).
map([H|R],P) :-
    call(P,H),
    map(R,P).

get_element([H|Rst],0,H).
get_element([H|Rst],N,E) :-
	N1 is N - 1,
	get_element(Rst,N1,E).

sudoku_rows_4x4([],A,A).
sudoku_rows_4x4([H1,H2,H3,H4|Rest],Accum,RowsList) :-
	append([],[[H1,' ',H2,' | ',H3,' ',H4,'\n']],R),
	append(Accum,R,NewList),
	sudoku_rows_4x4(Rest,NewList,RowsList).

print_rows_4x4([]).
print_rows_4x4(Sol) :-
	sudoku_rows_4x4(Sol,[],Rows),

	get_element(Rows,0,Row1),
	get_element(Rows,1,Row2),
	get_element(Rows,2,Row3),
	get_element(Rows,3,Row4),

	map(Row1,write),
	map(Row2,write),
	write('---------\n'),
	map(Row3,write),
	map(Row4,write).

sudoku_rows_6x6([],A,A).
sudoku_rows_6x6([H1,H2,H3,H4,H5,H6|Rest],Accum,RowsList) :-
	append([],[[H1,' ',H2,' ',H3,' | ',H4,' ',H5,' ',H6,'\n']],R),
	append(Accum,R,NewList),
	sudoku_rows_6x6(Rest,NewList,RowsList).

print_rows_6x6([]).
print_rows_6x6(Sol) :-
	sudoku_rows_6x6(Sol,[],Rows),

	get_element(Rows,0,Row1),
	get_element(Rows,1,Row2),
	get_element(Rows,2,Row3),
	get_element(Rows,3,Row4),
	get_element(Rows,4,Row5),
	get_element(Rows,5,Row6),

	map(Row1,write),
	map(Row2,write),
	write('-------------\n'),
	map(Row3,write),
	map(Row4,write),
	write('-------------\n'),
	map(Row5,write),
	map(Row6,write).


	
