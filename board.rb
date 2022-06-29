require_relative "card.rb"


class Board 

    def initialize(size = 4)
        @board= Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    def populate
        cards = []
        dup_cards=[]

        while cards.count < (@size**2)/2
            letter = ('A'..'Z').to_a.sample
            dup_letter = letter.dup
            cards += [ Card.new(letter)] unless cards.include?(letter)
            dup_cards += [ Card.new(dup_letter)] unless dup_cards.include?(dup_letter)
        end
        p dup_cards
        p cards.length
        
        cards = cards + dup_cards
        cards = cards.shuffle
        # p cards.tally.keys.length
        

        (0...@size).each do |i|
            (0...@size).each do |j|
                @board[i][j] = cards.pop
            end
        end
        #  p @board.flatten.tally.keys.length
    end 

    def render
        system("clear")
        (0...@size).each {|k| print k.to_s + ''}
        @board.each_with_index do |row, i| 
            print i.to_s + ' '
            row.each_with_index do |ele, j|
                if ele.face_down 
                    print ele.back_value + " "
                else
                    print ele.to_s + " "
                end
            end
        end
        return
    end

    def won?
         @board.each do |row| 
            puts
            row.each do |ele|
                if ele.face_down 
                    return false
                end
            end
        end
        return true
    end

    def reveal(guessed_pos)
        row = guessed_pos[0]
        col = guessed_pos[1]
        if @board[row][col].face_down
            @board[row][col].reveal
            return @board[row][col].face_value
        end
    end

    def [](guess_pos)
        row = guess_pos[0]
        col = guess_pos[1]
        @board[row][col]
    end

    #  def []=(guess_pos)
    #     row = guess_pos[0]
    #     col = guess_pos[1]
    #     @board[guess_pos[row][col]]
    # end




end