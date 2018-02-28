require_relative "player"
require_relative "ai_knuth_brain"

class AI < Player

  Guess = Struct.new(:color, :positions)

  def initialize
    super "AI"
    AIBrain.reset
  end

  def generate_code
    begin
      input = get_clean_input

      return input if valid_code? input
    rescue ArgumentError => e
      puts "Hey! #{e.message}"
      retry
    end
  end

  def set_last_state state
    AIBrain.set_feedback state
  end

  def make_guess
    sleep(0.05)

    AIBrain.generate_guess
  end
end
