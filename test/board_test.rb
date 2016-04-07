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

  def test_that_board_displays_properly
    skip
    @board.display_grid
  end

  def test_that_board_has_column_header
    assert @board.column_header
    assert_equal [1, 2, 3, 4], @board.column_header
  end

  def test_that_board_has_row_header
    assert @board.row_header
    assert_equal ["A","B","C","D"], @board.row_header
  end

  def test_placing_ship_on_board
    coord = [2, 3]
    @board.add_ship(coord)
    assert_equal @board.grid[coord.first][coord.last], "S"
    @board.display_grid
  end

  def test_convert_to_coordinates
    coord_1 = @board.convert_to_coordinates("A1")
    assert_equal [0, 0], coord_1

    coord_2 = @board.convert_to_coordinates("B2")
    assert_equal  [1, 1], coord_2

    coord_3 = @board.convert_to_coordinates("C3")
    assert_equal  [2, 2], coord_3

    coord_4 = @board.convert_to_coordinates("D2")
    assert_equal  [3, 1], coord_4
    @board.display_grid
  end


  def test_is_valid_ship_placement_on_board
    skip
    @board.display_grid
  end

  def test_is_not_overlapping_with_other_ships
    skip
  end

  def test_is_afraid_one_with_others
    skip
  end


end
