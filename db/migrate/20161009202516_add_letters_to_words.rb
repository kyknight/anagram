class AddLettersToWords < ActiveRecord::Migration
  def change
  	add_column :words, :letters, :string #three parameters - table name, new column name, and datatype.
  
  	Word.all.each do |word|
  		characters = word.text.chars
  		alphabetized_characters = characters.sort
  		word.letters = alphabetized_characters.join
  		word.save
  	end
  end
end
