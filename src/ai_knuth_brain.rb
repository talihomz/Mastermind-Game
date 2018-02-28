require_relative "board"
require "pp"

class AIBrain

  @@possible_codes = nil
  @@guess = nil

  def self.reset
    @@possible_codes = (1111..8888).to_a
    @@guess = nil
  end

  # receive feedback about our latest move
  def self.set_feedback state
    @@feedback = state

    eliminate_codes
  end

  def self.generate_guess
    if @@guess
      @@possible_codes.shuffle.first
    else
      @@guess = guess_translator(1122)
    end
    puts 'GUESSSS: ' + @@guess
    @@guess
  end

  private
  # convert guess from numbers like 1111 to strings like 'RRRR'
  def self.guess_translator guess
    (guess.to_s.split('').collect do |num_str|
      index = num_str.to_i - 1
      Board::POSSIBLE_COLORS[index]
    end).join('')
  end

  def self.eliminate_codes
    # filter the array of possible codes and remove all that don't give the same result
    @@possible_codes.select! do |c|
       process_number(c) == @@feedback # 1123
    end
  end

  def self.process_number n
    code = @@guess
    guess = guess_translator n

    # colors
    puts "CODE: #{code}"
    puts "GUESS: #{guess}"
    similar_colors = (code.split('') & guess.split('')).length
    # positions
    non_matches = 0
    code.split('').each_with_index do |val, idx|
      non_matches += 1 if val != guess[idx]
    end

    return {
      colors: similar_colors,
      positions: 4 - non_matches
    }
  end
end
