-module(daytwo).
-export([get_val/2],[shop_items/1],[show_winner/1]).

get_val([],_) -> false;
get_val([{K,V}|_],Key) when K =:= Key -> V;
get_val([{_,_}|Rest],Key) -> get_val(Rest,Key).

shop_items(ShopList) -> [{Item,Quant * Price} || {Item,Quant,Price} <- ShopList].


% I should probably put this in a seperate module
% when I started thinking of doing it this way I didn't
% think it would take this much code

% I feel like this could be done with lists:foldl
% I ran out of time to figure it out and wanted to move on
build_wins(L) -> build_wins_xo(L,{[],[]},1).
build_wins_xo([],WinList,_) -> WinList;
build_wins_xo([V | Rest],{Xs,Os},N) ->
	case V of
		"X" -> build_wins_xo(Rest,{[N|Xs],Os},N+1);
		"O" -> build_wins_xo(Rest,{Xs,[N|Os]},N+1);
		_   -> build_wins_xo(Rest,{Xs,Os},N+1)
	end. 

any_subset(Set,SetsList) -> any_subset(Set,SetsList,[]).
any_subset(_,[],SubList) -> SubList;
any_subset(Set,[Wn|Rest],SubList) -> 
	IsSub = sets:is_subset(Wn,Set),
	any_subset(Set,Rest,[IsSub|SubList]). 

show_winner_xo(true,_,_) -> x;
show_winner_xo(_,true,_) -> o;
show_winner_xo(false,false,S) when S >= 9 -> cat;
show_winner_xo(false,false,S) when S =< 9 -> no_winner.

show_winner(Board) ->
	{X,O} = build_wins(Board),

	Wins = [[1,2,3],[4,5,6],[7,8,9],
			[1,4,7],[2,5,8],[3,6,9],
			[1,5,9],[3,5,7]],
	Xs = sets:from_list(X),
	Os = sets:from_list(O),
	WinsSet = [sets:from_list(W) || W <- Wins],
	%io:format("Xs: ~p~nOs :~p~nWinsSet: ~p~n",[Xs,Os,WinsSet]),
	WsubX = any_subset(Xs,WinsSet),
	WsubO = any_subset(Os,WinsSet),
	XsubWins = lists:foldl(fun(V,B) -> V orelse B end, false, WsubX),
	OsubWins = lists:foldl(fun(V,B) -> V orelse B end, false, WsubO),
	XsUOs = sets:union(Xs,Os),
	NumTurns = sets:size(XsUOs),
	show_winner_xo(XsubWins,OsubWins,NumTurns).






