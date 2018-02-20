class Board

  def initialize(code)
    @code = code
    @attempts = []
    @state = { colors: 0, positions: 0 }
  end

  # display the board
  def display
    puts %{
  +---+---+---+---+---+---+
  | X | X | X | X | X | X |  CODE
  +---+---+---+---+---+---+

  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  1     [ colors : #{@state[:colors]}, positions : #{@state[:positions]} ]
  +---+---+---+---+---+---+
    }
  end

  def game_over
    max_attempts || code_broken
  end

  def add_attempt(attempt)
    @attempts << attempt
  end

  private
  def max_attempts
    @attempts.length == 12
  end

  def code_broken
    @state[:colors] == @state[:positions] && @state[:colors] == 6
  end

  # reset the board
  def reset
  end

end
