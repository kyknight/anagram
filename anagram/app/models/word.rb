class Word < ActiveRecord::Base

  def self.find_anagram(word)
    if word.length == 3
      word_array = word.split(//)
      drow_array = word_array.permutation.map{|i| i.join}

      return drow_array
    else
      puts "Incorrect word length. Please try again with a three letter word."
    end
  end

  def self.reverse_letters (letters)
    length= letters.length
    reverse_letters = Array.new(length)

    letters.each_with_index do |letter, index|
      reverse_letters[length - index - 1] = letter
    end
    reverse_letters
  end
end