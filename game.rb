require_relative 'player'
require_relative 'computer'
require_relative 'human'

class Game
  attr_reader :board
  
  def initialize board
    @board = board
    @maker = Computer.new
    @breaker = Human.new

    @code = @maker.code
  end

  def play
    #until game over
    @board.render_field
    @breaker.break
  end

end