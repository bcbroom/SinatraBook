require 'sinatra'

before do
	content_type :txt

	@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
	@throws = @defeat.keys
end

get '/throw/:type' do
	player_throw = params[:type].to_sym
	if !@throws.include?(player_throw)
		halt 403, "You must throw one of the following #{@throws}"
	end

	#now make a random throw for the computer
	computer_throw = @throws.sample
	
	#compare two throws and determine a winner
	if player_throw == computer_throw
		"You tied with the computer. Try again!"
	elsif computer_throw == @defeat[player_throw]
		"Nicely done! #{player_throw} beats #{computer_throw}."
	else
		"Ouch. #{computer_throw} beats #{player_throw}."
	end
end
		