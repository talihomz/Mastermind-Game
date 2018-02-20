class Board

  def initialize(code)
    @code = code
    @attempts = []
    @state = { colors: 0, positions: 0 }
  end

  # display the board
  def display
    print %{
  +---+---+---+---+---+---+
  | X | X | X | X | X | X |  CODE
  +---+---+---+---+---+---+

  +---+---+---+---+---+---+
}
    @attempts.reverse.each_with_index do |attempt, index|
      puts "  | #{d(attempt[0])} | #{d(attempt[1])} | #{d(attempt[2])} | #{d(attempt[3])} | #{d(attempt[4])} | #{d(attempt[5])} |  #{@attempts.length - index} [ colors : #{@state[:colors]}, positions : #{@state[:positions]} ]"
      puts '  +---+---+---+---+---+---+'
    end
  end

  def d(letter)
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
  end

  def game_over
    code_broken || max_attempts
  end

  def add_attempt(attempt)
    @attempts << attempt
  end

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
