require 'sinatra'

get '/' do
  @title = 'Italian Quiz'
  @questions = Hash.new
  @questions ["a pen"] = "una penna"
  @questions ["hello"] = ["salve", "ciao"]
  erb :quiz
end

post '/results' do
    @title = 'Italian Quiz Results'
    erb :results
end