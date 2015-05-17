module Main where
	colorCombos = 
		let colors = ["black","white","blue","yellow","red"] in [(a,b) | a <- colors, b <- colors, a<b]