class Human < Player
  
  # returns array of validated player choice
  def prompt
    print_query
      
    guess = gets.chomp
    exit if guess == 'exit'

    guess = guess.split(',').map{ |i| i.to_i}

    if !valid_guess?(guess)
      print "#{guess} is an invalid selection.\n\n"
      prompt
    else
      guess
    end
  end

  def code
    puts "Please choose a code for the AI to solve."
    return prompt
  end

  private

    def print_query
      print "Enter up to 4 unique colors, separated by commas (e.g. 1,4,5,6)\n".rjust(56, ' ')
      
      colors = Board::COLORS
      colors.each do |key, color|
        print "#{key} = " + "  ".color(color) + "  "
      end
      print ": "
    end

    def valid_guess?(input)
      if input.uniq.size.between?(1,4) && input.all? { |x| x.between?(1,6) }
        true
      else
        false
      end
    end
end