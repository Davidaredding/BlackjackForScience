
class Hand
	attr_accessor :Cards
	attr_reader :Value

	def initialize
		@Cards = Array.new
	end

	#gets highest possible value without going over 21
	def Value
		val = Proc.new{@Cards.reduce(0){|a,c| a+=c.Value}}
		if val.call > 21 
			@Cards.select{|c| c.Rank == Card.Ranks[0][:Rank]}.each do |c| 
			 c.Value = c.AltValue
				if(val.call <= 21)
					break
				end
			end
		end
		return val.call
	end
end