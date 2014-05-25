class Player
	attr_reader :Hand, :SplitHand, :Name

	def initialize(name)
		@Hand = Hand.new
		@SplitHand = Hand.new
		@Name = name
	end
end