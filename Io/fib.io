Fib := Object clone

fib_iter := Fib clone

fib_iter fib := method(F,
					i1 := 1;
					i2 := 1;
					F = F - 2;
					while(F > 0,
						i2_temp := i2;
						i2 = i1 + i2;
						i1 = i2_temp;
						F = F - 1); i2 println ) 

fib_recur := Fib clone

fib_recur fib := method(F, N := if(F <= 2, 
							return 1, 
							return fib(F-1) + fib(F-2)
							); N println )