class Board
  attr_reader :column_header, :row_header, :grid

  def initialize

    total_ships = 2
    board_size = 4
    @column_header = *(1..4)
    @row_header = *("A".."D")
    @grid = Array.new(board_size).map! { Array.new(board_size) {"."}}
    @ships = Array.new
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

  def convert_to_coordinates(string)
    row = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}
    [row[string[0]],string[1].to_i-1]
  end

  def add_ship(coord)
    @ships << Ship.new(coord)
    @grid[coord.first][coord.last] = 'S'
  end

  def is_position_on_board?(coord)
    @grid  
  end

end
