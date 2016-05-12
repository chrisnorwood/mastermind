class Board
  COLORS = {
      1 => :red, 
      2 => :green, 
      3 => :yellow, 
      4 => :blue, 
      5 => :pink, 
      6 => :cyan, 
      7 => :white
            }

  def initialize
    # @rounds is array of each 4-color guess with roundnumber - 1 as index
    # @feedback is array corresponding to round
    # each will always have 4 parts, even if nil
    @rounds = [[2, 4, 1, 3], [2, 4, 7, 1]]
    @feedback = [[:full, :full, :part, nil], [:full, :full, :part, nil]]
  end

  # Renders playing field of all rounds stored
  def render_field
    puts "  O".color(:red_text) + ": color match in place\n"
    puts "  O".color(:yellow_text) + ": color match in wrong place"
    print "\n"

    @rounds.each_with_index do |round, i|
      print "    #{i+1}. "
      round.each_with_index do |color|
        print "|" + "  ".color(COLORS[color]) + "|"
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

      print "\n    ----------------\n"
    end
  end
end