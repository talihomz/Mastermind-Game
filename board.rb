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
  end

  # reset the board
  def reset
  end

  # define private methods
  private :reset

end
