doFile("division.io")

// test for division.io
Tester := Object clone

new_div_tester := Tester clone

new_div_tester new_div_test := method(input, shouldBeVal,
									// if just use input the division 
									// isn't evaluated
									result := input;
									if(result == shouldBeVal,
										"pass" println,
										"fail" println);
									)
new_div_tester new_div_test(1/0,0);
new_div_tester new_div_test(1/1,1);
new_div_tester new_div_test(6/3,2);


