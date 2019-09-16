require "./player"

class Game
  def initialize
    @p1 = Player.new
    @p2 = Player.new
    @isTurn = 1
  end
  
  def scorechecker
    if @p1.score == 0
      return "Player 2 wins with a score of #{@p2.score}/3"
    elsif @p2.score == 0
      return "Player 1 wins with a score of #{@p1.score}/3"
    else
      return nil
    end
  end

  def get_question
    while self.scorechecker == nil
      num1 = rand(1...20)
      num2 = rand(1...20)
      player = self.playerturn
      operations = ["plus", "minus"]
      operation = operations.shuffle
      puts "#{player}: What is #{num1} #{operation[0]} #{num2} equal?"
      answer = gets.chomp
      add = num1 + num2
      subtract = num1 - num2
      if operation[0] == "plus" && answer.to_i == add
        puts "#{player}: Correct! Score is p1:#{@p1.score} vs p2:#{@p2.score}"
      elsif operation[0] == "minus" && answer.to_i == subtract
        puts "#{player}: Correct! Score is p1:#{@p1.score} vs p2:#{@p2.score}"
      else
        if player == "p1"
          @p1.lose
        end
        if player == "p2"
          @p2.lose
        end
      puts "#{player}: WRONG! Score is p1:#{@p1.score} vs p2:#{@p2.score}"
      end
    end
    if self.scorechecker != nil
      puts self.scorechecker
    end
  end

  def playerturn
    if @isTurn == 1
      @isTurn = 2
      return "p1"
    elsif @isTurn == 2
      @isTurn = 1
      return "p2"
    end
  end

end

g = Game.new()
g.get_question
