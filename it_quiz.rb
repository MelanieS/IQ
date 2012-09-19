puts "               __"
puts "              / _)"
puts "     _.----._/ /"
puts "    / melanie /"
puts " __/ (  | (  |"
puts "/__.-'|_|--|_|"
puts


require 'sinatra'

class Question
    attr_reader :name, :answer
    
    def initialize(name, answer)
        @name, @answer = name, answer
    end
end

class Answer
    attr_reader :given
    
    def initialize(given, question)
        @given, @question = given, question
    end
    
    def actual
        @question.answer
    end
end

helpers do
    def questions
    @questions = Hash.new
    [["a pen", "una penna"],
    ["a cat", "un gatto"],
    ["hello", "salve"],
    ].each do |name, answer|
        @questions[name] = Question.new name, answer
    end
    @questions
end
end

get '/' do
    @title = 'Italian Quiz'
    questions
    erb :quiz
end

post '/results' do
    @title = 'Italian Quiz Results'
    @answers = {}
    params[:questions].each do |name, answer|
        @answers[name] = Answer.new answer, questions[name]
    end
    erb :results
end