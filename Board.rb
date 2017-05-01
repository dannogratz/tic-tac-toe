require_relative 'Player.rb'

class Board
    attr_reader :board

    def initialize
        @board = (1..9).to_a
    end

    # print board in grid format
    def display
        top_row = board[0..2]
        middle_row = board[3..5]
        bottom_row = board[6..8]
        puts "\n" + top_row.join(" | ") + "\n"
        9.times { print "-" }
        puts "\n" + middle_row.join(" | ") + "\n"
        9.times { print "-"}
        puts "\n" + bottom_row.join(" | ") + "\n\n"
    end

    # check picked spot for availability
    def check (pick, player) 
        if board[pick] == pick + 1
            board[pick] = player.marker
            true
        else
            false
        end
    end

    # check if player has won game
    def win (player)
        wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,9],[0,4,8],[2,4,6]]
        wins.each do |w|
            temp = player.picked & w
            temp.to_s.length == 9 ? (return true) : false
        end
    end
end

