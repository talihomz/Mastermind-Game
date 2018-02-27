require_relative "board"
require "pp"

class AIBrain

  # AI 'memory'
  @@lookup = {}
  @@feedback = { colors: 0, positions:0 }
  @@possible_colors = Array.new(Board::POSSIBLE_COLORS)

  def self.reset
    @@possible_colors.each do |color|
      @@lookup[color] = [1,2,3,4]
    end

    @@keys_tried = []
    @@feedback = { colors: 0, positions:0 }
    @@lucky_key = @@lookup.keys.shuffle.first
  end

  # only method that can update state of lookup
  def self.set_feedback state

    # check if colors improved
    change = state[:colors] <=> @@feedback[:colors]
    if(change > 0)
      # we found a new color
      @@lucky_key = get_guessable_key

    elsif(change == 0)
      # we dint discover any new color
      @@lookup[@@lucky_key] = []
      @@lucky_key = get_guessable_key
    else
      # we removed a color that exists in the code
      puts "Found an anomaly"
    end
  end

  def self.generate_guess
    # we need to join our guesses so far with our new guess
    repeat_length = @@keys_tried.length => 4 ? 0 : 4 - @@keys_tried.length

    (@@keys_tried + Array.new(repeat_length) { @@lucky_key }).join('')
  end

  def self.get_guessable_key
    if @@keys_tried.length == 4
      return 'rrrr'
    else
      res = ((@@lookup.select do |k,v| v.length > 0 end).keys - @@keys_tried).shuffle.first
      @@keys_tried.push(res)
      res
    end
  end
end
