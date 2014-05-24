doFile("fib.io")

// test for fib.io
Tester := Object clone

fib_iter_tester := Tester clone

fib_iter_tester fib_iter_test := method(input, shouldBeVal,
									result := fib_iter fib(input);
									if(result == shouldBeVal,
										"pass" println,
										"fail" println);
									)
fib_iter_tester fib_iter_test(1,1)
fib_iter_tester fib_iter_test(2,1)
fib_iter_tester fib_iter_test(3,2)
fib_iter_tester fib_iter_test(4,3)
fib_iter_tester fib_iter_test(5,5)
fib_iter_tester fib_iter_test(6,8)

fib_recur_tester := Tester clone

fib_recur_tester fib_recur_test := method(input, shouldBeVal,
									result := fib_recur fib(input);
									if(result == shouldBeVal,
										"pass" println,
										"fail" println);
									)
fib_recur_tester fib_recur_test(1,1)
fib_recur_tester fib_recur_test(2,1)
fib_recur_tester fib_recur_test(3,2)
fib_recur_tester fib_recur_test(4,3)
fib_recur_tester fib_recur_test(5,5)
fib_recur_tester fib_recur_test(6,8)