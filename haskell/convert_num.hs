module Main where
	convertToNum inString = 
		let ns = filter(\x -> x /= '$' && x /= ',' && x /= '.') inString
		    dropZero = dropWhile (\y -> y == '0') ns in

		    read dropZero :: Int 