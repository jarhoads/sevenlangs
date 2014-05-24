Number oldDivision := Number getSlot("/")

Number / := method(denom,
					if(denom == 0, 
						0, 
	                    self oldDivision(denom)
	                )
                  )