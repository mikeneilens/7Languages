
def word_count(chars) 
	count = 0
	lastChar = " "
	chars.each do |char| 
 		if ((lastChar == " ") && (char != " ")) 
			count = count + 1
		end
		lastChar = char
	end
	count
end

letters = 'hello world'.split("")
puts("String '#{letters}' contains #{word_count(letters)} words")

letters = 'hello  world'.split("")
puts("String '#{letters}' contains #{word_count(letters)} words")

letters = ' hello world'.split("")
puts("String '#{letters}' contains #{word_count(letters)} words")

letters = 'helloworld'.split("")
puts("String '#{letters}' contains #{word_count(letters)} words")

letters = ''.split("")
puts("String '#{letters}' contains #{word_count(letters)} words")
