require_relative "board.rb"


class Game
    def initialize
        @board = Board.new
        @previous_guess = []
        @guess_pos = []
    end

    def play
        until @board.won?
            @board.render
            puts "Please enter the position of the card you'd like to flip (e.g. '1, 2')"
            input = gets.chomp
            @guess_pos = input.split(",").map(&:to_i)
            if @board[@guess_pos].face_down
                @board.reveal(guess_pos)
                @board.render
                @previous_guess = @guessed_pos
            end
            puts "Please enter the position of the card you'd like to flip (e.g. '1, 2')"
            input2 = gets.chomp
            @guess_pos = input.split(",")
            if @board[guess_pos].face_down
                @board.reveal(guess_pos)
                if @board[@previous_guess].face_value  == @board[guess_pos].face_value
                    puts "It's a match!"
                    @previous_guess = ""
                else
                    sleep(4)
                    puts "Try Again"
                    @board[@previous_guess].hide
                    @board[@guess_pos].hide
                end
            end


        end
    end


end

Game.new.play