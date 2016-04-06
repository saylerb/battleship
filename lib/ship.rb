class Ship

  attr_accessor :position, :sunk, :hits

  def initialize(position = [])
    @position = position
    @hits = 0
    @sunk = false
  end

end
