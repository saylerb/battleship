class Ship

  attr_reader :coords, :sunk, :hits, :health

  def initialize(coord)
    @coords = [coord[0], coord[1]]
    @health = 1
    @hits = 0
  end

  def hit_ship
    unless @health == 0
      @health -= 1
    else
      @sunk = true
    end
  end

   def sunk 
     @health == 0 
   end

end


