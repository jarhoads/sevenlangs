module Main where
	qs [] = []
	qs (h:t) = (qs less) ++ [h] ++ (qs great)
	           where
	           	less = filter (< h) t
	           	great = filter (>= h) t

	qsp [] _ = []
	qsp (h:t) pred = (qsp (filter (\x -> pred x h) t) pred) ++ 
	                 [h] ++
	                 (qsp (filter (\x -> not(pred x h)) t) pred)
