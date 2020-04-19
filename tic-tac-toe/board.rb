class Board 
    attr_accessor :field
    def initialize(field)
      @field = field
    end

    def show
      i = 0
      puts " "
      while @field.length > i 
        puts "#{@field[i]} | #{@field[i+1]} | #{@field[i+2]}"
        i += 3
      end
    end

    #check if all the field is tied by either player1's symbol or player2's symbol 
    #Return false if not full,  true if it is 
    def full?(player1, player2) 
        full = @field.all? {|f| f == player1.symbol || f == player2.symbol }
        full ?  "-------Board full, no one won----------" : ""
        return full
    end

end


  
