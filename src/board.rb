require 'pp'

class Board

  Attempt = Struct.new(:attempt, :state)
  POSSIBLE_COLORS = ['R', 'G', 'B', 'O', 'W', 'Y', 'P', 'C']
  FIELDS = 6

  def initialize(code)
    @code = code
    reset
  end

  # reset the board
  def reset
    @attempts = []
  end

  # display the board
  def display
    final_row = %{
  +---+---+---+---+---+---+
  | X | X | X | X | X | X |    SECRET CODE
  +---+---+---+---+---+---+
}

    final_game_over_row = %{
  +---+---+---+---+---+---+
  | #{d(@code[0])} | #{d(@code[1])} | #{d(@code[2])} | #{d(@code[3])} | #{d(@code[4])} | #{d(@code[5])} | SECRET CODE
  +---+---+---+---+---+---+
}

    print game_over ? final_game_over_row : final_row

    @attempts.reverse.each_with_index do |attempt_struct, index|
      attempt = attempt_struct[:attempt]
      state = attempt_struct[:state]
      display_index = @attempts.length - index

      puts "  +---+---+---+---+---+---+" if index == 0
      puts "  | #{d(attempt[0])} | #{d(attempt[1])} | #{d(attempt[2])} | #{d(attempt[3])} | #{d(attempt[4])} | #{d(attempt[5])} |  #{display_index} [ colors : #{state[:colors]}, positions : #{state[:positions]} ]"
      puts '  +---+---+---+---+---+---+'
    end
    
  end

  def d(letter)
    begin
      case letter.downcase
        when 'r' then 'O'.red
        when 'g' then 'O'.green
        when 'b' then 'O'.blue
        when 'o' then 'O'.orange
        when 'w' then 'O'.white
        when 'y' then 'O'.yellow
        when 'p' then 'O'.pink
        when 'c' then 'O'.cyan
      end
    rescue StandardError => e
      puts e.message
    end
  end

  def update_state(guess)
    similar_colors = (@code.split('') & guess.split('')).length

    non_matches = 0
    @code.split('').each_with_index do |val, idx|
      non_matches += 1 if val != guess[idx]
    end

    state = {
      colors: similar_colors,
      positions: FIELDS - non_matches
    }

    new_attempt = Attempt.new(guess, state)
    add_attempt(new_attempt)
  end

  def game_over
    code_broken || max_attempts
  end

  def max_attempts
    @attempts.length == 12
  end

  def get_last_state
    if(@attempts.length == 0)
      { colors: 0, positions: 0 }
    else
      @attempts.last[:state]
    end
  end

  def code_broken
    return false if @attempts.length == 0
    current_idx = @attempts.length - 1
    state = @attempts[current_idx][:state]
    state[:colors] == state[:positions] && state[:colors] == FIELDS
  end

  def add_attempt(attempt)
    @attempts << attempt
  end
end
