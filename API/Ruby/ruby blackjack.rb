=begin
	I don't care what Ruby purists say
	multiline-comments are the shit! So use an editor with syntax hilighting
	If this *Really* bugs you, change it, or delete it. But really, why are 
	focusing on this small aspect?
	
	http://en.wikipedia.org/wiki/Blackjack

	Easy Mode:
		* - Deal cards to the player
		* - Hit, Stand
		* - Game only have to lasts for 1 round
		* - Unique Cards (IE there can't be more than one Ace of Spades delt)
		* - All cards must have at least a Rank, Suite and Value assigned
		* - Playable in the console
	Medium Mode:
		Add a dealer with dealer rules
		* - Hand Total must account for Ace being valued at 1 or 11
		* - Multi deck shoe support
		Game continues untill player quits
		Hand limit of 5 cards (5 card charlie)
	Hard Mode:
		Betting
		Push
		Surrender
		Client side schema Wired up and hosted
		Dealer Protection (Don't allow the front end to change the dealers calcualtions in anyway)
	Code Complete:
		Insurance
		Split
		Double Down

=end


require "./hand"
require "./deck"
require "./card"
require "./player"
require "./game"






class BlackJack
	attr_accessor :Hand, :Deck
	def initialize
		
		@Hand = Array.new
		@Deck = Deck.new
	end

	def total
		accum = 0
		for card in @Hand 
			accum += card.Value
		end
		return accum
	end

	def Run
		#only create 1 hand
		@Hand.push(@Deck.Deal(),@Deck.Deal())
		#@Hand.push(Card.new_using_Rank(Card.Ranks[0], Card.Suits[0]), Card.new_using_Rank(Card.Ranks[0], Card.Suits[0]))
		puts "Total is #{total}"


		while true do
			puts "Hit or stand"

			if gets[0].upcase == 'H'
				puts "Hit!"
				c = @Deck.Deal()
				puts "#{c.Rank} of #{c.Suit}"
				@Hand.push(c)
			else
				puts "Standing!"
				break;
			end


			if(IsBusted?(@Hand))
				#shamelessly stolen from http://stackoverflow.com/questions/1489183/colorized-ruby-output
				
				puts "\e[31mBusted!!\e[0m  Total is #{total}"
				break;
			end

			puts "Total is #{total}"

		end
	end

	def self.IsBusted?(hand)
		hand.each do |c| 
		 c.Value = c.AltValue
			if(total <= 21)
				break
			end
		end
		return total > 21
	end
end

bj = BlackJack.new
#bj.Run()

player = Player.new("ballz")
deck = Deck.new
crd1 = Card.new_using_Rank(Card.Ranks[0],Card.Suits[0])
crd2 = Card.new_using_Rank(Card.Ranks[0],Card.Suits[0])
player.Hand.Cards.push(crd1,crd2)
puts player.Hand.Value()