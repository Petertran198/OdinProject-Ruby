class Board 
  attr_accessor :field
  def initialize()
    @field = [
      1, 2, 3,
      4, 5, 6,
      7, 8, 9
    ]
  end

  def show
    puts " "
    puts "#{@field[0]} | #{@field[1]} | #{@field[2]}"
    puts "#{@field[3]} | #{@field[4]} | #{@field[5]}"
    puts "#{@field[6]} | #{@field[7]} | #{@field[8]}"
  end

  #check if all the field is tied by either player1's symbol or player2's symbol 
  #Return false if not full,  true if it is 
  def full?(player1, player2) 
      full = @field.all? {|f| f == player1.symbol || f == player2.symbol }
      return full
  end

end

