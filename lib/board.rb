class Board
  attr_reader :columns, :rows, :grid

  def initialize

    total_ships = 2
    board_size = 4
    @columns = *(1..4)
    @rows = *("A".."D")
    @grid = Array.new(board_size).map! { Array.new(board_size) {"."}}
    @ships = Array.new
  end

  def display_grid
    puts ""
    print "  "
    print @columns.each { |cell| cell }.join(" ")
    puts ""
    @grid.each_index do |index|
      print @rows[index] + " "
      puts @grid[index].each { |cell| cell }.join(" ")
    end
    puts ""
  end

  def valid_input?(string)
    row, column = string[0], string[1]
    @rows.include?(row) && @column.include?(column)
    # if rowinclude?(string[0]) && string[1]
  end

  def valid_row?(row)
    @rows.include?(row)
  end

  def valid_column?(column)
    @columns.include?(column)
  end


  def convert_coord(string)
    row, column = string[0], string[1]
    [@rows.index(row), string[1].to_i-1]
  end

  def add_ship(coord)
    @ships << Ship.new(coord)
    @grid[coord.first][coord.last] = 'S'
  end

  def is_position_on_board?(coord)
     coord.first.between?(0, 4) && coord.first.between?(0, 4)
  end

end
