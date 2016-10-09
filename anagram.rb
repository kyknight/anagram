require_relative 'reverse_letters'

puts "What is the three letter word?"
word = gets.chomp.downcase

def find_anagram(word)
	if word.length == 3
		word_array = word.split(//)
		drow_array = word_array.permutation.map{|i| i.join}

		return drow_array
	else
		puts "Incorrect word length. Please try again with a three letter word."
	end
end



