require "json"

class Card
	@@Ranks =  [{Rank: "Ace", 	Value: 11, 	AltValue: 1},
				{Rank: "King", 	Value: 10, 	AltValue: 10},
				{Rank: "Queen", Value: 10, 	AltValue: 10},
				{Rank: "Jack", 	Value: 10, 	AltValue: 10},
				{Rank: "Ten", 	Value: 10, 	AltValue: 10},
				{Rank: "Nine", 	Value: 9, 	AltValue: 9},
				{Rank: "Eight", Value: 8, 	AltValue: 8},
				{Rank: "Seven", Value: 7, 	AltValue: 7},
				{Rank: "Six", 	Value: 6, 	AltValue: 6},
				{Rank: "Five", 	Value: 5, 	AltValue: 5},
				{Rank: "Four", 	Value: 4, 	AltValue: 4},
				{Rank: "Three", Value: 3, 	AltValue: 3},
				{Rank: "Two", 	Value: 2, 	AltValue: 2}] #Yeah, learned about hashes, You like it, don'cha bitch?

	@@Suits = [:Spades,:Hearts, :Clubs, :Diamonds]
	def self.Ranks
		return @@Ranks
	end
	def self.Suits
		return @@Suits
	end


	attr_accessor :Rank, :Suit, :Value, :AltValue
	
	def self.new_using_Rank(ranks, suit) #No constructor overloading?
		rank = ranks[:Rank]
		suit = suit
		value = ranks[:Value]
		altValue = ranks[:AltValue]
		return self.new(rank, suit,value,altValue)
	end

	def initialize(rank, suit, value, altValue)
		if altValue == 0 
			altValue = value 
		end
		@Rank = rank
		@Suit = suit
		@Value = value
		@AltValue = altValue
		
	end

	def to_s
		return "#{@Rank} of #{@Suit}, value of #{@Value}, alternative value of #{@AltValue}"
	end

	def to_json
		puts "hello"
		return 
			{
				"rank" => @Rank,
				"suit" => @Suit,
				"value" => @Value,
				"altValue" =>@AltValue
			}.to_json
	end
end