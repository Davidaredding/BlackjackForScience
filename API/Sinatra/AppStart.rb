require 'sinatra'
require 'json'
require 'ruby_blackjack'

#adds all our controllers and routes
Dir["./Controllers/*Controller.rb"].each{|file| require file}


configure do
	set :public_folder, File.dirname(__FILE__) + '/Static'
	set :views, settings.root + '/Views'
	set :port, 8080
	enable :sessions
end