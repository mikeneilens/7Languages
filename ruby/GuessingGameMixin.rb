
module PlayGame
	def makeGuess(valueToGuess, guessesLeft)	
		showQuestion(guessesLeft)
		guess = gets.to_i

		unless guessIsCorrect?(guess, valueToGuess) 
			if guessesLeft > 1 
				makeGuess(valueToGuess, guessesLeft - 1) 
			else 
				puts "You ran out of guesses. Looooser!"
			end
		end		
	end
end

module GameRules
	def showQuestion(guessesLeft)
		puts "Guess a number between 0 and 9. You have #{guessesLeft} guesses left."
	end

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
end

class GuessTheNumber
	include GameRules
	include PlayGame
end

GuessTheNumber.new().makeGuess(rand(10),3)


