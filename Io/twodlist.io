two_d_list := List clone

two_d_list dim := method(x,y,

					//list of y lists that are x elements long
					for(i,1,y,
						m := list();
						for(j,1,x,
							m append(nil)
							);
						self append(m)
						);
					
					return self

					) 

two_d_list set := method(x,y,v,
					self at(y) atPut(x,v)
					)
					
two_d_list get := method(x,y,
					return(self at(y) at(x))
					)

two_d_list transpose := method(
						
						cDim := self size;
						rDim := self at(0) size;

						t := list();

						for(r,0,(rDim-1),
							m := list()
							for(c,0,(cDim-1),
								m append(self get(r,c))
								);
								t append(m)
							);

						return t;

						)

two_d_list writeFile := method(f,

							dataFile := File open(f);

							dataFile write(self serialized);

							dataFile close;
						)

two_d_list readFile := method(f,

							self := doFile(f);

							self
						)



