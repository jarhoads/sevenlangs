module Main where

	checkPrime n a = 
		if (a*a) > n then 
			True 
		else 
			(if (rem n a) == 0 then 
				False
			else
				checkPrime n (a+1) )


	isPrime n = checkPrime n 2

	primes n = take n (filter isPrime [2..])
