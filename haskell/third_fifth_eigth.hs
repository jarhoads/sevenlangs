module Main where
	third x = x:(third (x + 3))

	fifth y = y:(fifth (y + 5))
	
	eigth z = zipWith (+) (third z) (fifth z)