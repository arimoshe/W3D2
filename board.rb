require_relative "card.rb"


class Board 

    def initialize(size = 4)
        @board= Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    def populate
        cards = []

        while cards.count < (@size**2)/2
            letter = ('A'..'Z').to_a.sample
            cards << letter unless cards.include?(letter)
        end

        puts cards
        cards += cards

        (0...@size).each do |i|
            (0...@size).each do |j|
                inst = cards.sample 
                               cards.delete_at(cards.index(inst))
                @board[i][j] = inst
            end
        end
    end 

end