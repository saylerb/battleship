class Board
  attr_reader :columns, :rows, :grid, :ocean, :target
  attr_accessor :ships

  def initialize

    total_ships = 2
    board_size = 4
    @columns = *(1..4)
    @rows = *("A".."D")
    @grid = Array.new(board_size).map! { Array.new(board_size) {"."}}
    @ocean = @grid
    @target = @grid
    @ships = Array.new
    @hits = Array.new
  end

  # TODO: dynamically generate grid from information in Ships array

  def generate_ocean
    @ships.each do |ship|
      @ocean[ship.coordinates[0]][ship.coordinates[1]] = "S" 
    end
  end

  def generate_target
    @ships.each do |ship|
      @target[ship.coordinates[0]][ship.coordinates[1]] = "X" if ship.health == 0
    end
  end

  def display(grid, title)
    puts 
    puts title
    puts 
    print "  "
    print @columns.each { |cell| cell }.join(" ")
    puts ""
    grid.each_index do |index|
      print @rows[index] + " "
      puts grid[index].each { |cell| cell }.join(" ")
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

  def convert_string_to_coord(string)
    row, column = string[0], string[1]
    [@rows.index(row), column.to_i-1]
  end

  def add_ship(coord)
    @ships << Ship.new(coord)
    # @grid[coord.first][coord.last] = 'S'
  end

  def is_position_on_board?(coord)
     coord.first.between?(0, 4) && coord.first.between?(0, 4)
  end

  def is_occupied?(coord)
    @ships.any? { |ship| ship.coordinates == coord }
  end


end
