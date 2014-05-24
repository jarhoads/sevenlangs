answerCorrect = false
randVal = rand(10)
while not answerCorrect
	puts "Guess what number it is: "
	STDOUT.flush  
	guess = gets.chomp.to_i


	puts "sorry, your guess is too high" if guess > randVal
	puts "sorry, your guess is too low" if guess < randVal
	
	answerCorrect = (guess==randVal)


end

puts "correct! it was #{randVal}"