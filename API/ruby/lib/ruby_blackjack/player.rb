class Player
	attr_reader :Hand, :SplitHand, :Name, :Busted

	def initialize(name)
		@Hand = Hand.new
		@SplitHand = Hand.new
		@Name = name
	end

	def ClearHands
		@Hand.Cards.clear
		@SplitHand.Cards.clear
	end

	def to_json
		return "{\"hand\" : #{@Hand.to_json}, \"name\" : \"#{@Name}\"}"
	end


end