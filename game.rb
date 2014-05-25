
class Game
	attr_accessor :Players

	def initialize
		@Players = [Player.new("Player 1"), Player.new("Dealer")] 
	end
end