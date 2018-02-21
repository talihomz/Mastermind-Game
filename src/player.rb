class Player

  @name = 'NAME'

  # generate the secret code
  def generate_code
    possible_colors = ['R', 'G', 'B', 'O', 'W', 'Y', 'P', 'C']
    2.times do possible_colors.delete_at(rand(possible_colors.length)) end
    code = possible_colors.shuffle.join('')
    code
  end

  # try to guess the secret code
  def make_guess
    print "\nTake a guess (e.g. `R G B W C P`): "
    input = gets.chomp
    input = input.gsub(/[\s|,]/,'').upcase

    if(input.match(/^[RGBYWCPO]+$/) == nil)
      raise ArgumentError.new("The colors specified are not valid!")
    end

    if(input.length != 6)
      raise ArgumentError.new("You need to specify 6 colors")
    end

    return input
  end

end
