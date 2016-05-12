require_relative 'board'
require_relative 'game'
require_relative 'string'

puts "\n
                  _                      _           _ 
  /\\/\\   __ _ ___| |_ ___ _ __ _ __ ___ (_)_ __   __| |
 /    \\ / _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |
/ /\\/\\ \\ (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |
\\/    \\/\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|\n\n"

board = Board.new
game = Game.new(board)
game.play()