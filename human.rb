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
      
      result = gets.chomp.split(',').map{ |i| i.to_i}

      if !valid_guess?(result)
        puts "Invalid selection."
        prompt
      else
        p result
      end
    end

    def valid_guess?(input)
      if input.uniq.size == 4 && input.all? { |x| x > 0 && x < 7 }
        true
      else
        false
      end
    end
end