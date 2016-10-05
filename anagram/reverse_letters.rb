def reverse_letters (letters)
	length= letters.length
	reverse_letters = Array.new(length)

	letters.each_with_index do |letter, index|
		reverse_letters[length - index - 1] = letter
	end
	reverse_letters
end