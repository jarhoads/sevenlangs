-module(dayone).
-export([count_words/1]).
-export([count_to_ten/0]).
-export([print_value/1]).

count_words([]) -> 1;
count_words([$\ | Rest]) -> 1 + count_words(Rest);
count_words([_ | Rest])  -> count_words(Rest).

count_to_ten() -> rec_count_ten(1).
rec_count_ten(10) -> 10;
rec_count_ten(N) -> io:format("~p~n",[N]),
				rec_count_ten(N+1).

print_value(success) -> io:format("success");
print_value({error,Msg}) -> io:format("error:~s",[Msg]);
print_value(_) -> io:format("invalid input").