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

    @@feedback = { colors: 0, positions:0 }
    @@lucky_key = @@lookup.keys.shuffle.first
  end

  # only method that can update state of lookup
  def self.set_feedback state

    # check if colors improved
    change = state[:colors] <=> @@feedback[:colors]
    if(change > 0)
      # we found a new color


    elsif(change == 0)
      # we dint discover any new color
      @@lookup[@@lucky_key] = []
      @@lucky_key = get_guessable_key
    else
      # we removed a color that exists in the code
      puts "Found an anomaly"
    end

    pp @@lookup
  end

  def self.generate_guess
    get_guess_on_key(@@lucky_key).join('')
  end

  private

  def self.lookup_is_pristine?
    @@lookup.all? do |k,v| v.length == 4 end
  end

  def self.get_guessable_key
    (@@lookup.select do |k,v| v.length > 0 end).keys.shuffle.first
  end

  def self.get_guess_on_key key
    Array.new(@@lookup[key].length) { key }
  end
end
