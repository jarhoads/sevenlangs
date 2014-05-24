# test roman.rb

def shouldBe(input, shouldBeVal)
	puts "#{input} should be: #{shouldBeVal}"
	if input == shouldBeVal
		puts "pass"
	else
		puts "fail"
	end
	puts " "
end

def romanTest

	puts "Testing Roman.X"
	shouldBe(Roman.X,10)

	puts "Testing Roman.XC"
	shouldBe(Roman.X,110)

	puts Roman.XII
	puts Roman.X
end
