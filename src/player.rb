require 'set'

class Player

  def initialize(type="Human")
    @type = type
    @possible_colors = ['R', 'G', 'B', 'O', 'W', 'Y', 'P', 'C']
  end

  # generate the secret code
  def generate_code
    get_random_code
  end

  # try to guess the secret code
  def make_guess
    print "\nTake a guess (colors: 'R' 'G' 'B' 'O' 'W' 'Y' 'P' 'C'): "
    input = get_clean_input

    return input if valid_code? input
  end

  def get_random_code
    possible_colors = Array.new @possible_colors
    6.times do possible_colors.delete_at(rand(possible_colors.length)) end
    code = possible_colors.shuffle.join('')
    return code
  end

  def get_clean_input
    input = gets.chomp
    return input.gsub(/[\s|,]/,'').upcase
  end

  def valid_code?(input)
    if(input.match(/^[RGBYWCPO]+$/) == nil)
      raise ArgumentError.new("The colors specified are not valid!")
    end

    if(input.length != 6)
      raise ArgumentError.new("You need to specify 6 colors")
    end

    if @type == "AI"
      set_is_good = input.split('').to_set.length == input.length
      raise ArgumentError.new("The code cannot contain repeated colors") unless set_is_good
    end

    true
  end

end
