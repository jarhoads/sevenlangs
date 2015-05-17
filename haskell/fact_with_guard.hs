module Main where
	factorial_g :: Integer -> Integer
	factorial_g x
		| x > 1 = x * factorial_g (x - 1)
		| otherwise = 1