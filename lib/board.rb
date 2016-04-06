class Board
  attr_reader :column_header, :row_header, :grid

  def initialize

    total_ships = 2
    board_size = 4
    @column_header = *(1..4)
    @row_header = *("A".."D")
    @grid = Array.new(board_size).map! { Array.new(board_size) {Cell.new}}
  end

  def display_grid
    puts ""
    print "  "
    print @column_header.each { |cell| cell }.join(" ")
    puts ""
    @grid.each_index do |index|
      print @row_header[index] + " "
      puts @grid[index].each { |cell| cell }.join(" ")
    end
    puts ""
  end

  def add_ship(x, y)
    @grid[x][y] = Ship.new(x, y)
  end

  def is_position_on_board?(x, y)
  end

end

class Cell
  attr_reader :value
  attr_accessor :occupied

  def initialize
    @value = "?"
    @occupied = false
  end

end
