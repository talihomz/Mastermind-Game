require_relative "board"
require "pp"

class AIBrain

  @@possible_codes = nil
  @@guess = nil
  @@possible_colors = Array.new(Board::POSSIBLE_COLORS)

  def self.reset
    @@possible_codes = (1111..8888).to_a
    @@guess = nil
  end

  # only method that can update state of lookup
  def self.set_feedback state


  end

  def self.generate_guess

  end

  private
  def self.guess_translator guess
    (guess.to_s.split('').collect do |num_str|
      index = num_str.to_i - 1
      @@possible_colors[index]
    end).join('')
  end
end
