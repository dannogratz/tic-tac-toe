class Player
	attr_reader :name, :marker, :picked
	@@player_count = 0

	def initialize
		puts "Player #{(@@player_count % 2) + 1} what is your name?"
		@name = gets.chomp.capitalize
		@picked = []
		@@player_count += 1
		(@@player_count % 2) == 1 ? @marker = "X" : @marker = "O"
	end

end
