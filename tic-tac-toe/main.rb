require './board.rb' 
require './game.rb'
require './player.rb'
require './winning_coordinates.rb'
game = Game.new(
  name: "Tic Tac Toe",
  winning_coords: WinningCoordinates.new([ 
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]]).coordinates,
  board: Board.new         
        )
game.start