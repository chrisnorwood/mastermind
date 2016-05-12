class Human < Player
  def break
    input = prompt
  end

  private
    def prompt
      print "Enter up to 4 unique colors, separated by commas (e.g. 1,4,5,6)\n".rjust(56, ' ')
      
      colors = Board::COLORS
      colors.each do |key, color|
        print "#{key} = " + "  ".color(color) + "  "
      end
      print ": "
      gets.chomp
    end
end