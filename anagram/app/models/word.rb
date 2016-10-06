class Word < ActiveRecord::Base

  def self.find_anagram(string)
    anagrams = [] #array to store  anagrams.
    letters = string.split(//) # converts word to an array of letters.
    combinations = []

    letters.each do |letter| #loop through each letter in letters
      remaining = letters.select { |1| 1 != letter }

      anagrams << letter + ramaining.join('')
      anagrams << letter + reverse_letters(remaining).join('')
    end
    
    anagrams.each do |potential|   #Returns anagram array
      if Word.find_by_text(potential).present?
        combinations << potential
      end
    end
    combinations
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