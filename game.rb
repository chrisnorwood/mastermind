require_relative 'player'
require_relative 'computer'
require_relative 'human'

class Game
  attr_reader :board
  
  def initialize board
    @board = board
    
    if computer_maker?
      @maker = Computer.new
      @breaker = Human.new
    else
      @maker = Human.new
      @breaker = Computer.new
    end

    @code = @maker.code
  end

  def play
    until game_over?
      @board.render_field
      input = @breaker.prompt
      @board.add_round(input, @code)
    end

    if game_over?
      @board.render_field
      if winner?
        puts "You broke the code!".color(:red_text)
      elsif loser?
        puts "You lost!".color(:red_text)
      end
      
      print "The code was: "
      @board.render_code(@code)
      print "\n"

      replay_prompt
    end
  end

  private
    def replay_prompt
      print "Would you like to play again? (yes or no) : "
      input = gets.chomp.downcase

      case input
      when 'yes'
        Mastermind.new
      when 'no'
        puts "Thanks for playing!"
        exit
      else
        puts "Invalid input."
        replay_prompt
      end
    end

    def computer_maker?
      puts "Would you like to make or break the code? Enter make or break."
      input = gets.chomp

      case input
      when 'break'
        true
      when 'make'
        false
      else
        puts "Invalid input."
        computer_maker?
      end
    end

    def game_over?
      winner? || loser?
    end

    def winner?
      @board.rounds[-1] == @code
    end

    # Sets maximum board size to 12
    def loser?
      @board.rounds.size == 12 && (@board.rounds[-1] != @code)
    end
end