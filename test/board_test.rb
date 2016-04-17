require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/ship'
require './lib/print'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_if_board_exists
    assert @board
  end

  def test_that_board_has_a_size
    assert_equal 4, @board.grid.length
  end

  def test_that_board_contains_elements
    # puts @board.grid.inspect
    assert @board.grid.flatten[0]
    assert_equal @board.grid.flatten[0], "."
  end

  def test_that_board_has_column_header
    assert @board.columns
    assert_equal [1, 2, 3, 4], @board.columns
  end

  def test_that_board_has_row_header
    assert @board.rows
    assert_equal ["A","B","C","D"], @board.rows
  end

  def test_placing_human_ship_on_board
    coord = [2, 3]
    @board.add_ship(coord)
    @board.generate_ocean
    # @board.display(@board.ocean)

    assert_equal @board.ocean[coord.first][coord.last], "S"
  end

  def test_placing_display_hit_on_computer_ship
    coord = [2, 3]
    @board.add_ship(coord)
    @board.ships.find { |ship| ship.coordinates == [2, 3] }.hit_ship
    @board.generate_target
    # @board.display(@board.target)
    
    assert_equal @board.target[coord.first][coord.last], "X"
  end

  def test_convert_string_to_coord
    coord_1 = @board.convert_string_to_coord("A1")
    assert_equal [0, 0], coord_1

    coord_2 = @board.convert_string_to_coord("B2")
    assert_equal  [1, 1], coord_2

    coord_3 = @board.convert_string_to_coord("C3")
    assert_equal  [2, 2], coord_3

    coord_4 = @board.convert_string_to_coord("D2")
    assert_equal  [3, 1], coord_4
  #  @board.display_grid
  end

  def test_is_position_on_board?
    assert @board.is_position_on_board?(@board.convert_string_to_coord("A1"))
    assert @board.is_position_on_board?(@board.convert_string_to_coord("B2"))
    assert @board.is_position_on_board?(@board.convert_string_to_coord("C4"))
    assert @board.is_position_on_board?(@board.convert_string_to_coord("A1"))
  end

  def test_is_valid_rows_and_columns
    assert @board.valid_row?("A")
    refute @board.valid_row?("Z")

    assert @board.valid_column?(4)
    refute @board.valid_column?(5)
  end

  def test_is_not_overlapping_with_other_ships
    @board.add_ship([0, 0])
    @board.add_ship([1, 2])
  
    assert @board.is_occupied?([0, 0])
    assert @board.is_occupied?([1, 2])
    refute @board.is_occupied?([2, 3])
    refute @board.is_occupied?([2, 2])
  end


end
