class Game 

    def initialize(name)
      puts "Lets Play #{name}"
      @winning = WinningCoordinates.new([ 
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]]).coordinates
    end


    #Start the game 
    def start
      @player1 = init_questions("first")
      @player2 = init_questions("second")
      symbol_check(@player1, @player2)
      puts "Okay #{@player1.name.capitalize} you are #{@player1.symbol} and #{@player2.name.capitalize} you are #{@player2.symbol}"
      @won = false 
      @board = Board.new
      self.keep_playing(@player1, @player2, @winning)
    end

    #Ask for names 
    def init_questions(order) 
      puts "Enter #{order} player's name"
      name = gets.chomp 
      puts "Enter a symbol"
      symbol = gets.chomp
      player = Player.new(name, symbol)
      return player
    end

    #Check to see that symbols are not identical 
    def symbol_check(player1,player2) 
      if player1.symbol == player2.symbol 
        puts "Cant be the same symbol try again.."
        @player1 = init_questions("first")
        @player2 = init_questions("second")
      else
        return 
      end
    end

    #Prompt to keep playing 
    def play(main_player, player2) 
      puts "----------------------"
      puts "#{main_player.name}, where do you want to go?"
      #This is for regex because regex only take "strings"
      answer = gets.chomp
      #This is to find the index position of my board 
      cell = answer.to_i - 1 
      #If the answer does not consist of the STRING 1-9 OR if it is already taken give error and let them do it over again 
      if (!answer[/[1-9]/] || @board.field[cell] == main_player.symbol ||      @board.field[cell] == player2.symbol)
          puts "Error please try again #{main_player.name}"
          @board.show 
          self.play(main_player,player2)
      else 
        @board.field[cell] = main_player.symbol
      end
    end

    #Check to see if player1 or player2 has won
    #It does this by match if the winning_cordinates subarray has all matched
    #If a player has all winning coordinate of a row then he won 
    #Return the player obj so we can use their attributes in other methods 
    def winner?(player1, player2, winning_cordinates)
      winning_cordinates.each do |row|
        return player1 if row.all? {|r| @board.field[r] == player1.symbol }
        return player2 if row.all? {|r| @board.field[r] == player2.symbol }
      end
      #return false if no one win
      return false
    end
    
    
    #Loop to keep playing until @won != false 
    def keep_playing(player1, player2, winning_cordinates) 
      while @won == false || @board.full?(player1, player2) == false
          @board.show
          play(player1,player2)
          @won = winner?(player1, player2, winning_cordinates)
          break if @won != false
          break if @board.full?(player1,player2)
          puts "----------------------"
          @board.show
          play(player2,player1)
          @won = winner?(player1, player2, winning_cordinates)
          break if @won != false
          break if @board.full?(player1,player2)    
        end
      winning_message(@won)
      @board.full?(player1,player2)
      @board.show
      play_again
    end

    #Check if you won
    def winning_message(won) 
      puts won != false ? "-----#{won.name} has won!------" : " "
    end

  #Ask if You Want to play again
    def play_again
      puts ""
      puts "--------- ?? Again ?? ----------"
      @won = false 
      puts "Would you like to play again? Yes or No"
      answer = gets.chomp 
      case answer 
      when /^y/i
          start
      when /(^n)/i
          puts "Have a great day"
      else
          puts "Can not understand"
          play_again 
      end 
    end

end