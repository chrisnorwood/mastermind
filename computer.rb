class Computer < Player
  
  # returns array of size 4, containing unique 
  # combination of COLOR keys
  def code
    code = []
    while code.size != 4
      rand_number = 1 + rand(7)

      if !code.include?(rand_number) || code.empty?
        code << rand_number
      end
    end
    code
  end
end