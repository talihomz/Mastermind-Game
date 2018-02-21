require 'set'

class Player

  def initialize(type="Human")
    @type = type
  end

  # generate the secret code
  def generate_code
    if @type == "Human"
      get_random_code
    else
      begin
        input = get_clean_input

        return input if valid_code? input
      rescue ArgumentError => e
        puts "Hey! #{e.message}"
        retry
      end
    end
  end

  # try to guess the secret code
  def make_guess
    if @type == "Human"
      print "\nTake a guess (e.g. `R G B W C P`): "
      input = get_clean_input

      return input if valid_code? input
    else
      sleep(0.5)
      return get_random_code
    end
  end

  def get_random_code
    possible_colors = ['R', 'G', 'B', 'O', 'W', 'Y', 'P', 'C']
    2.times do possible_colors.delete_at(rand(possible_colors.length)) end
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
