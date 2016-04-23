require "colorize"

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
      @ocean[ship.coords[0]][ship.coords[1]] = "S" 
    end
  end

  def generate_target
    @ships.each do |ship|
      @target[ship.coords[0]][ship.coords[1]] = "X" if ship.health == 0
    end
  end

  def display(grid, title)
    puts 
    puts title.colorize(:red) if title == "SHOTS FIRED"
    puts title.colorize(:blue) if title == "YOUR SHIPS"
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
  end

  def valid_row?(row)
    @rows.include?(row)
  end

  def valid_column?(column)
    @columns.include?(column)
  end

  def convert_string_to_coord(string)
    row, column = string[0], string[1]
    [@rows.index(row.upcase), column.to_i-1]
  end

  def add_ship(coord)
    @ships << Ship.new(coord)
  end

  def is_position_on_board?(coord)
     coord.first.between?(0, 4) && coord.first.between?(0, 4)
  end

  def is_occupied?(coord)
    @ships.any? { |ship| ship.coords == coord }
  end


end
