require_relative "board"
require "pp"

class AIBrain

  @@possible_codes = nil
  @@guess = nil

  def self.reset
    # generate all codes from 111111 to 888888 that don't contain a digit 0
    @@possible_codes = (111111..888888).to_a

    puts "Generating Codes"
    @@possible_codes.select! do |n|
      !n.to_s.match(/[09]/)
    end

    @@guess = nil
  end

  # receive feedback about our latest move
  def self.set_feedback state
    @@feedback = state

    eliminate_codes if @@guess
  end

  def self.generate_guess
    if @@guess
      @@guess = guess_translator(@@possible_codes.shuffle.first)
    else
      @@guess = guess_translator(111222)
    end

    @@guess
  end

  private
  # convert guess from numbers like 1111 to strings like 'RRRR'
  def self.guess_translator guess
    #puts "==========\nINPUT #{guess}"
    res = (guess.to_s.split('').collect do |num_str|
      index = num_str.to_i - 1
      Board::POSSIBLE_COLORS[index]
    end).join('')
    #puts "==========\nOUTPUT #{res}"
    return res
  end

  def self.eliminate_codes
    # filter the array of possible codes and remove all that don't give the same result
    @@possible_codes.select! do |c|
       process_number(c) == @@feedback
    end
  end

  def self.process_number n
    code = @@guess
    guess = guess_translator n

    similar_colors = (code.split('') & guess.split('')).length
    # positions
    non_matches = 0
    code.split('').each_with_index do |val, idx|
      non_matches += 1 if val != guess[idx]
    end

    return {
      colors: similar_colors,
      positions: 6 - non_matches
    }
  end
end
