class Deck
	attr_reader :Shoe, :Discard

	def initialize(shoeSize = 1)
		@Shoe = Array.new
		@ShoeSize = shoeSize
		buildDeck() #<--  Without the parens, it just seems naked.
		@Shoe.shuffle!
	end

	def Deal
		return @Shoe.shift
	end

	private
		def buildDeck
			(1..@ShoeSize).each do |x|
				Card.Ranks.each do |r_val|
					Card.Suits.each do |s_val|
						val = r_val[:Value]
						altValue = r_val[:AltValue]
						rank = r_val[:Rank]
						@Shoe.push(Card.new(rank,s_val,val,altValue))
					end
				end	
			end
		end	
end