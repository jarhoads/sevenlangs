module Main where
	allEven :: [Integer] -> [Integer]
	allEven [] = []
	allEven (h:t) = if even h then h : allEven t else allEven t

	allEven2 :: [Integer] -> [Integer]
	allEven2 intlist = [x | x <- intlist, even x]

	allEven3 :: [Integer] -> [Integer]
	allEven3 intlist = filter even intlist