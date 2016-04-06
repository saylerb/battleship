
module Print

  def self.welcome
    "Welcome to BATTLESHIP!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    file =  File.open('./lib/instructions.txt', 'r') { |file| file.read }
  end

  def self.invalid_input
    "Sorry, that is not valid."
  end

  def self.ship_placement_instructions
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the second is three units long. 
    The grid has A1 at the top left and D4 at the bottom right.
    Enter the squares for the two-unit ship:"
  end

end 



