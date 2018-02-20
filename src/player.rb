class Player

  @name = 'NAME'

  # generate the secret code
  def generate_code
  end

  # try to guess the secret code
  def make_guess
    print "Take a guess (e.g. `R G B W C P`): "
    input = gets.chomp
    input = input.gsub(/[\s|,]/,'').upcase

    if(input.match(/^[RGBWCPO]+$/) == nil)
      raise ArgumentError.new("The colors specified are not valid!")
    end

    if(input.length != 6)
      raise ArgumentError.new("You need to specify 6 colors")
    end

    return input
  end

end
