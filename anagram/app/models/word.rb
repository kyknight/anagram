class Word < ActiveRecord::Base

  def self.find_anagram(word)
    anagrams = []
    word_array = word.downcase.split(//) # place the characters of the word into an array
    combinations = word_array.permutation.map{ |i| i.join } # joins the 3 character array with all permutations and inserts each into output array.
    
    combinations.each do |potential|
      if Word.find_by_text(potential).present?
        anagrams << potential
      end
    end
    
    anagrams
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