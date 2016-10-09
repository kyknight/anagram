class Word < ActiveRecord::Base
  before_create :add_letters

  def add_letters
      characters = self.text.chars
      alphabetized_characters = characters.sort
      self.letters = alphabetized_characters.join
  end

  def self.find_anagram(string)
    anagrams = [] #array to store  anagrams.
    letters = string.split(//) # converts word to an array of letters.
    combinations = []

    letters.each do |letter| #loop through each letter in letters
      remaining = letters.select { |l| l != letter}

      anagrams << letter + remaining.join('')
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

  def self.three_letters?(input)
      if input.length == 3
          true
      else 
          false
      end
  end

  def self.distinct_letters?(input)
      letter_array = input.chars
      unique_letters = letter_array.uniq
      if unique_letters.length == letter_array.length
         true
      else
         false
      end
  end

  def self.valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
      true
    else
      raise Exception.new("Word must be less than or equal to 3 characters.")
    end
  end

end


