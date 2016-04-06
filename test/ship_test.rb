require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @ship = Ship.new
  end

  def test_if_ship_exists
    assert @ship
  end

  def test_if_new_ship_has_no_position
    assert_equal @ship.position, []
  end

  def test_if_ship_can_take_a_position
    @ship.position = [0, 0]
    assert_equal [0, 0], @ship.position
  end

  def test_if_new_ship_is_not_sunk
    refute @ship.sunk
  end

  def test_if_new_ship_has_no_hits
    assert_equal @ship.hits, 0
  end


end
