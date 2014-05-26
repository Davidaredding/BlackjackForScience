Gem::Specification.new do |s|
	s.name			= "ruby_blackjack"
	s.version		= "1.0.0"
	s.date			= "2014-05-26"
	s.summary		= "Simple Ruby Blackjack library"
	s.description	= "A simple library that has the basic Blackjack functionality"
	s.authors		= ["Dave Redding"]
	s.email			= "DavidARedding@gmail.com"
	s.files			= ["./lib/ruby_blackjack.rb", 
					   "./lib/ruby_blackjack/card.rb",
					   "./lib/ruby_blackjack/deck.rb",
					   "./lib/ruby_blackjack/hand.rb",
					   "./lib/ruby_blackjack/player.rb"
					  ]
	s.homepage		= "http://www.davidaredding.com"
	s.license		= "MIT"
end