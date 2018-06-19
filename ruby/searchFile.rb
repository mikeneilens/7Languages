def search_For_Text(file_to_search, search_text)

	file_in_an_array = IO.readlines(file_to_search)

	file_in_an_array.each_with_index do |line, index| 
		if line.include? search_text 
			puts "Line #{index} contains #{search_text}: #{line}"
		end 
	end

end

search_For_Text("fileToSearch.text", "magic")