module Main where
	mapColoring :: [(([Char],[Char]),([Char],[Char]),([Char], [Char]),([Char], [Char]),([Char], [Char]))]
	mapColoring = 
		let colors = ["red","blue","green"]
		    coloring = [(tn,ms,al,ga,fl) | tn <- colors, ms <- colors, al <- colors, ga <- colors, fl <- colors,
		                                   ms /= tn, ms /= al, al /= ga, al /= fl, ga /= fl, ga /= tn] in
		[(("TN",c1),("MS",c2),("AL",c3),("GA",c4),("FL",c5)) | (c1,c2,c3,c4,c5) <- coloring]