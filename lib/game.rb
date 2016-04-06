class Game
  attr_reader :playing

  def initialize
    @playing = false
  end

  def play
   @playing = true 
  end

  def create_computer
  end

  def create_player
  end

end

