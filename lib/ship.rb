class Ship

  attr_accessor :position, :sunk, :hits

  def initialize(coord)
    @position = [coord[0], coord[1]]
    @hits = 0
    @sunk = false
  end

end
