def guessIsCorrect?(guess, numberToGuess) 
	if guess == numberToGuess 
		puts "correct"
		true
	else
		if guess < numberToGuess
			puts "too low"
		else
			puts "too high"
		end
		false
	end
end


def makeGuess(numberToGuess, guessesLeft)
	
	puts "Guess a number between 0 and 9. You have #{guessesLeft} guesses left."
	guess = gets.to_i

	unless guessIsCorrect?(guess, numberToGuess) 
		if guessesLeft > 1 
			makeGuess(numberToGuess, guessesLeft - 1) 
		else 
			puts "Looooser!"
		end
	end		

end

makeGuess(rand(10),3)


