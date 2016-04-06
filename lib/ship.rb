class Ship

  attr_accessor :position, :sunk, :hits

  def initialize(x, y)
    @position = [x, y]
    @hits = 0
    @sunk = false
  end

end
