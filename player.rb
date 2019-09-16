class Player
  attr_accessor :score

  def initialize
    @score = 3
  end

  def score
    return @score
  end

  def lose
    @score = @score - 1
  end

end

