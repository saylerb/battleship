class Board
  attr_reader :column_header, :row_header, :grid

  def initialize

    total_ships = 2 
    board_size = 4
    @column_header = *(1..4)
    @row_header = *("A".."D")
    @grid = Array.new(board_size).map! { Array.new(board_size) {"O"}}
  end

  def display_grid

    puts @column_header.each { |cell| cell }.join(" ")
    @grid.each_index do |index|
      print @row_header[index] + " "
      puts @grid[index].each { |cell| cell }.join(" ")
    end
    
  end


  def set_computer
  end

  def validate_ship
  end

  def validate_overlap
  end

  # check for valid coordinates
  # check for conflicts with other ships
end

