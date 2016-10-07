require 'sinatra'

get '/' do
	erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  @anagrams = Word.find_anagram(@word)
  erb :show
end

post '/' do
  @word = params[:word]
  if Word.valid_input?(@word)
  	redirect "/anagrams/#{@word}"
  else
  	@error = "You have an invalid input. Please try again with a three lettered word."
  	erb :index
  end
end