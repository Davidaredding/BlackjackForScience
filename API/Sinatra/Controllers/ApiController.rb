

get '/api/Draw/?:count?' do
	content_type :json
	deck = Deck.new
	numdraw = params[:count].to_i
	puts numdraw
	retval = Array.new

	for i in 0..numdraw #why does this work when numdraw is 0?
		c = deck.Deal()
		card = {:Rank => c.Rank, :Suit => c.Suit, :Value => c.Value, :AltValue => c.AltValue}
		retval.push(card)
	end
	return retval.to_json
end