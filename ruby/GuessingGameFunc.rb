
#In this case you need to pass blocks in as lambdas as Yield can only accept a single block
def playGame(&showPrompt, &guessIsCorrect, valueToGuess, guessesLeft)

	def makeGuess(valueToGuess, guessesLeft)
	
		showPrompt.call guessesLeft
		guess = gets.to_i

		unless guessIsCorrect.call(guess, valueToGuess) 
			if guessesLeft > 1 
				makeGuess(valueToGuess, guessesLeft - 1) 
			else 
				puts "Looooser!"
			end
		end		
	end

	makeGuess(valueToGuess, guessesLeft)
end

# '->'' creates an anonymous function. The keyword 'lamda' is the same as '->'.
promptDisplayer = -> {|guessesLeft| puts "Guess a number between 0 and 9. You have #{guessesLeft} guesses left." }

guessValidator = -> do |guess, numberToGuess| 
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

playGame(promptDisplayer, guessValidator, rand(10),3)


