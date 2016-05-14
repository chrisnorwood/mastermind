class Computer < Player

  # returns array of computer's guess
  def prompt
    sleep 2
    code
  end

  # returns array of size 4, containing unique 
  # combination of COLOR keys
  def code
    code = []
    while code.size != 4
      rand_number = 1 + rand(6)

      if !code.include?(rand_number) || code.empty?
        code << rand_number
      end
    end
    code
  end
end