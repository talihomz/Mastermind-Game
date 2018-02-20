class Board

  @code = ''
  @attempts = []
  @state = { colors: 0, position: 0 }

  # setter method for code
  def code=(code)
    @code = code
  end

  # getter method for code
  def code
    @code
  end

  # display the board
  def display
    puts %{
  +---+---+---+---+---+---+
  | X | X | X | X | X | X |  CODE
  +---+---+---+---+---+---+

  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  12    [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  11    [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  10    [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  9     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  8     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  7     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  6     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  5     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  4     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  3     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  2     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
  |   |   |   |   |   |   |  1     [ colors : 0, positions : 0 ]
  +---+---+---+---+---+---+
    }
  end

  # reset the board
  def reset
  end

  # define private methods
  private :reset

end
