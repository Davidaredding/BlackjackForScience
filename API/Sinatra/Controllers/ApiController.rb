

get '/api/Draw/?:count?' do
	deck = session[:deck] = session[:deck] == nil ? Deck.new() : session[:deck]
	content_type :json
	
	numdraw = params[:count].to_i 
	retval = Array.new

	for i in 1..numdraw #why does this work when numdraw is 0?
		c = deck.Deal()
		card = {:Rank => c.Rank, :Suit => c.Suit, :Value => c.Value, :AltValue => c.AltValue}
		retval.push(card)
	end

	puts "Cards remaining: #{deck.Shoe.length}"

	return retval.to_json
end

post '/api/Player/?' do
	y = JSON.parse(request.body.read)
	puts session[:name]
	if y["name"].to_s.empty?
		status = 400
		body = {:error => "Malformed data, name is missing "}.to_json
	
	else
		puts y["name"]
		session[:player] = Player.new(y["name"].to_s)
		puts session[:player]
	end

end

get '/api/Player/?' do
	content_type :json
	if(session[:player] == nil)
		return {:error => "Name is not currently in session"}.to_json
	else
		pl = session[:player]
		return pl.to_json
	end
end

get '/api/utilities/PushCardTest/?' do
	pl = session[:player]
	deck = Deck.new
	
	return pl.to_json
end

get '/api/utilities/ClearSession' do
	session.clear
end