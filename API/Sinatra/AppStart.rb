require 'sinatra'
require 'json'
require_relative "../Ruby/ruby_blackjack.rb"

#adds all our controllers and routes
Dir["./Controllers/*Controller.rb"].each{|file| require file}


configure do
	set :public_folder, File.dirname(__FILE__) + '/Static'
	set :views, settings.root + '/Views'
	set :port, 8080
end