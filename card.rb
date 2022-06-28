class Card

    @@CARDS = ('A'..'Z').to_a

    def possibleCards
        @@CARDS
    end

    def initialize(face_value)
        @face_down = true
        @face_value = face_value
        @back_value = "🃏"
    end

    def reveal
        @face_down = false if @face_down
        self
    end
    
    def hide
        @face_down = true unless @face_down
         self
    end

    def to_s
        @face_value.to_s
    end

    def ==(value)
        self.to_s == value.to_s
       
    end

end