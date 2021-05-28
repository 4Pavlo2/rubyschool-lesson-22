require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"		
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
    @user_name = params[:user_name]
    @phone = params[:phone]
    @date_time = params[:date_time]

    @title = 'Thank you'
    @message2 = "Dear #{@user_name}, we'll be waiting for you at #{@date_time} "

    f = File.open './public/users.txt', 'a' #це щоб свторювася файл і зберігав дані запису.
    f.write "Users: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}.\n"
    f.close

    erb :message2
end

post '/contacts' do
    @email = params[:email]

    @title = 'Thank you'
    @message2 = "Dear your mail #{@email} "

    f = File.open './public/contacts.txt', 'a' #це щоб свторювася файл і зберігав дані запису.
    f.write "email: #{@email}.\n"
    f.close

    erb :contacts
end