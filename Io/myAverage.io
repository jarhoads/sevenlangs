List myAverage := method(
					if(self size == 0, return 0)

					s := 0
					c := 0

					self foreach(i,v,

							if(v type != "Number", 
								Exception raise("NonNumericValue", 
										"A non numeric value " v " was found in " call message name),

								// if the value is a type of Number
								// add the value to the sum and add one to the count 
								s := s + v
								c := c + 1	
								)

								);

					return s / c
					)
