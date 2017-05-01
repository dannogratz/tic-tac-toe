require_relative 'Board.rb'
require_relative 'Player.rb'

class TicTacToe
    attr_reader :active_player
    @@plays = 0

    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        rand(1..2) == 1 ? @active_player = @player1 : @active_player = @player2
        welcome(@player1, @player2, @active_player)
    end

    # Welcome players to game
    def welcome(p1, p2, player) 
        puts "Welcome #{p1.name} and #{p2.name}!"
        @board.display
        puts "#{player.name}, You go first!"
        puts "Choose location to place #{player.marker}"
        choose(@active_player)
    end

    # @active_player chooses spot
    def choose (player)
        # check for draw
        if @@plays >= 9 
            puts "\n\n        DRAW!\n\n"
            play_again
        end
        print "> "
        choice = gets.chomp.to_i - 1
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        if (@board.check(choice, player)) == false  
            puts "Location Taken, Try Again"
            choose(player)
        else
            player.picked << choice
            @@plays += 1
        end
        # check for win
        if (@board.win(player)) == true 
            puts "\n\n     CONGRATULATIONS #{player.name.upcase}! YOU WIN!\n\n"
            play_again
        else
            switch(player)
        end
    end

    # switch active player
    def switch (player)
        if player == @player1
            @player1 = player
            @active_player = @player2
        else
            @player2 = player
            @active_player = @player1
        end
        @board.display
        puts "#{@active_player.name}, Choose location to place #{@active_player.marker}"
        choose(@active_player)
    end

    def play_again
        puts "Play again? (Y/N)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
            @@plays = 0
            TicTacToe.new
        else
            puts "Exiting..."
            exit
        end
    end

end

game = TicTacToe.new