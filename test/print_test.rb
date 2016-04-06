require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/print'

class PrintTest < Minitest::Test
  def test_welcome_message
    assert Print.welcome.include?("Welcome")
  end

  def test_instructions_message
    assert Print.instructions.include?("Instructions:")
  end

  def test_ship_placement_instructions
    assert Print.ship_placement_instructions.include?("laid out my ships on the grid.")
  end


end
