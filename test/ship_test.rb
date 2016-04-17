require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @ship = Ship.new([0, 0])
  end

  def test_if_ship_exists
    assert @ship
  end

  def test_if_ship_has_coordinates
    assert_equal [0, 0], @ship.coordinates
  end

  def test_if_new_ship_is_not_sunk
    refute @ship.sunk
  end

  def test_if_new_ship_has_no_hits
    assert_equal @ship.hits, 0
  end

  def test_if_ship_is_not_sunk
    refute @ship.sunk
  end

  def test_if_ship_is_sunk
    @ship.hit_ship
    assert @ship.sunk
  end

  def test_if_ship_has_health
    @ship.health = 10 
    assert_equal 10, @ship.health
  end

  def test_if_ship_has_health
    assert_equal 1, @ship.health
  end

end
