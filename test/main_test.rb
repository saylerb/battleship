require 'minitest/autorun'
require 'minitest/pride'
require 'test_helper'
require './lib/main'

class MainTest < Minitest::Test
  def test_if_main_exists
    main = Main.new
    assert main
  end

  def test_that_menu_controls_work
    main = Main.new
    main.display_main_menu 
  end
end
