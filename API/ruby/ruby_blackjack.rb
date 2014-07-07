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



require_relative "./ruby_blackjack/hand"
require_relative "./ruby_blackjack/deck"
require_relative "./ruby_blackjack/card"
require_relative "./ruby_blackjack/player"




	# simulates blackjack on the command line.
	class BlackJack
		Deck = Deck.new
		Player1 = Player.new("Player 1")
		Dealer = Player.new("Dealer")
		@Playing = true

		#gameloop
		def Run
			puts "Welcome to BlackJack"
			while true do
				puts "In the loop"
				#deal cards
				Player1.Hand.Cards.push(Deck.Deal(),Deck.Deal())
				Dealer.Hand.Cards.push(Deck.Deal(),Deck.Deal())
				#resolve insurance or black jack

				#allow player to play
				puts "#{Dealer.Name} is showing #{Dealer.Hand.Cards[0].Rank} of #{Dealer.Hand.Cards[0].Suit}"
				while Player1.Hand.Value <= 21 do
					puts "Your total is #{Player1.Hand.Value}, would you like to Hit or Stand?"
					input = gets.chomp()
					if input[0].upcase == "S"
						puts "You stand on #{Player1.Hand.Value}"
						puts #adds another new line
						break;
					end
					c = Deck.Deal
					puts "Hit gets #{c}"
					Player1.Hand.Cards.push(c)
			
					if Player1.Hand.Value > 21
						puts "\033[34mBusted!!!\033[0m"
					end
				end

				if  Player1.Hand.Value <= 21
				#allow dealer to play
					puts "#{Dealer.Name} reveals #{Dealer.Hand.Cards[1].Rank} of #{Dealer.Hand.Cards[1].Suit}"
					while Dealer.Hand.Value <17 do
						c = Deck.Deal
						Dealer.Hand.Cards.push(c)
						puts "#{Dealer.Name} hits and gets #{c}"
						puts "#{Dealer.Name} shows #{Dealer.Hand.Value}"
						
						if(Dealer.Hand.Value >21)
							puts "#{Dealer.Name} \033[34mBusted!!!\033[0m. #{Player1.Name} Wins!!"
							@Playing = false
							break;
						end
					end
				end
				
				if(Dealer.Hand.Value < 22 && Player1.Hand.Value < 22)
					puts "#{Dealer.Name} stands"
					winner = (Dealer.Hand.Value > Player1.Hand.Value ? Dealer : Player1)
					puts "#{winner.Name} Wins!"
					puts ""
				end
				puts "Would you like to play again?"
				input = gets.chomp[0].upcase
				if input != "Y"
					break
				else
					Player1.ClearHands
					Dealer.ClearHands
				end
			end
			puts "Thanks for Playing!"
			return nil
		end
	end

if __FILE__ == $0

	bj = BlackJack.new
	bj.Run()
#
#	# player = Player.new("ballz")
#	# deck = Deck.new
#	# crd1 = Card.new_using_Rank(Card.Ranks[0],Card.Suits[0])
#	# crd2 = Card.new_using_Rank(Card.Ranks[0],Card.Suits[0])
#	# player.Hand.Cards.push(crd1,crd2)
#	# puts player.Hand.Value()
end