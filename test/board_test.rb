require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
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
    #puts @board.grid.inspect
    assert @board.grid.flatten.include?("O")
  end


  def test_that_board_displays_properly
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



end
