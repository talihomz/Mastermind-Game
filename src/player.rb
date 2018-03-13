require 'set'

class Player
  def initialize(type = 'Human')
    @type = type
    @possible_colors = %w[R G B O W Y P C]
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

  def is_ai?
    @type == 'AI'
  end

  def get_random_code
    possible_colors = Array.new @possible_colors
    2.times { possible_colors.delete_at(rand(possible_colors.length)) }
    code = possible_colors.shuffle.join('')
    code
  end

  def get_clean_input
    input = gets.chomp
    input.gsub(/[\s|,]/, '').upcase
  end

  def valid_code?(input)
    if input.match(/^[RGBYWCPO]+$/).nil?
      raise ArgumentError, 'The colors specified are not valid!'
    end

    raise ArgumentError, 'You need to specify 6 colors' if input.length != 6

    if @type == 'AI'
      set_is_good = input.split('').to_set.length == input.length
      raise ArgumentError, 'The code cannot contain repeated colors' unless set_is_good
    end

    true
  end
end
