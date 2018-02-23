require_relative "player"

class AI < Player
  def initialize
    super "AI"
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

  def make_guess
    sleep(0.2)
    get_fill_color
  end

  def get_fill_color
    "rrrrrr"
  end
end
