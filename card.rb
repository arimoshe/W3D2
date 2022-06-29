class Card

    @@CARDS = ('A'..'Z').to_a


    attr_reader :face_down, :face_value, :back_value

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

    def ==(inst)
        self.to_s == inst.to_s
       
    end

end