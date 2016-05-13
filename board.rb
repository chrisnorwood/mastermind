class Board
  attr_reader :rounds

  COLORS = {
      1 => :red, 
      2 => :green, 
      3 => :yellow, 
      4 => :blue, 
      5 => :pink, 
      6 => :cyan, 
      7 => :white
            }

  # @rounds is array of each 4-color guess with roundnumber - 1 as index
  # @feedback is array corresponding to round
  # each will always have 4 parts, even if nil
  def initialize
    @rounds = []
    @feedback = []
  end

  def add_round(input, code)
    # adds user input to Board @rounds instance
    @rounds << input
    add_feedback(input, code)
  end

  # Renders playing field of all rounds stored
  def render_field
    puts "  O".color(:red_text) + ": color match in place\n"
    puts "  O".color(:yellow_text) + ": color match in wrong place"
    print "\n"

    if @rounds.empty?
      print "    1. "
      4.times do
        print "| X |"
      end
      print "\n       --------------------\n"
    end

    @rounds.each_with_index do |round, i|
      # Prints array of color keys as color boxes with its key
      print "    #{i+1}. "
      round.each_with_index do |color|
        print "|" + " #{color} ".color(COLORS[color]) + "|"
      end
      
      if round.size < 4
        num = 4 - round.size
        num.times do
          print "| X |"
        end
      end

      print "  "
      
      @feedback[i].each do |match|
        case match
        when :full
          print "O".color(:red_text) + " "
        when :part
          print "O".color(:yellow_text) + " "
        end
      end

      print "\n       --------------------\n"
    end
  end

  private

    # accepts array of breaker's choice of colors
    # accepts code to compare input against
    def add_feedback input, code
      feedback = []

      input.each_with_index do |color, i|
        code.each_with_index do |code_color, k|
          if code_color == color && i == k
            feedback << :full
          elsif code_color == color
            feedback << :part
          end
        end
      end
      @feedback << feedback.sort
    end
end