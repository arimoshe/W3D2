class Game
    def initialize
        @board = Board.new
        @previous_Guesses = []
        @guess_pos = []
    end

    def play
        until board.won?
            @board.render
            puts "Please enter the position of the cardd you'd like to flip (e.g. '1, 2')
            

        end
    end

end