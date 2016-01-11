require 'sinatra'
require 'mandrill'
require 'tilt/erb'

set :bind, '0.0.0.0'

#arrays

games = ["basketball", "sorcer", "tennis", "volleyball", "noooooo, wait; i love every single game in the world"]




get '/' do 
 erb :index
end

get '/game' do
  		#a lil code to choose random games
  		randomsport = games[rand(games.size)]
  		"My best game is #{randomsport}"
  	end


    get '/contact' do
      @title= 'Contact'
      erb :contact
    end

    get '/locator' do
      @title = 'locator'
      erb :locator
    end

    post '/email' do
      #puts params.inspect
      email = params["email"]
      sender = params["name"]
      email_body = params["comment"]
      puts 'sending email!'
      m = Mandrill::API.new 
      message = { 
       :subject=> "New customer membership submission!",  
       :from_name=> sender,  
       :text=> email_body,  
       :to=>[
        {
          :email=> "ogera4u@yahoo.com", 
          :name=> "ade akin"
        }
        ],  
        :html=>"<html><h1><strong>#{email_body}</strong></h1></html>",  
        :from_email=> email 
      } 

      sending = m.messages.send message 
      puts sending
      redirect to('/thanks')
    end

    get '/thanks' do
     erb :thanks
   end

   get '/sign-in' do
      #puts "my params are" + params.inspect
      puts "You are in"
      @password = params[:password]
      @username = params[:username]
      erb :signin
    end

    post '/test' do
      erb :test
    end

