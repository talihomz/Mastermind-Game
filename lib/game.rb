class Game
  def max_tries=(tries)
    raise TypeError unless tries.is_a? Integer
    raise ArgumentError, 'Invalid tries count. Expected input between 6 and 12' unless tries.between?(6, 12)
    @max_tries = tries
  end

  attr_reader :max_tries

  def code_length=(code_length)
    raise TypeError unless code_length.is_a? Integer
    raise ArgumentError, 'Invalid code length. Expected 4, 6 or 8' unless [4, 6, 8].include?(code_length)
    @code_length = code_length
  end

  attr_reader :code_length
end
