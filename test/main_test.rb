require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/main'
require './lib/print'

class MainTest < Minitest::Test
  def test_if_main_exists
    main = Main.new
    assert main
  end

  def test_that_menu_controls_work
    main = Main.new
    assert main.display_main_menu.include?("BATTLESHIP")
  end

  def test_user_selection
    main = Main.new
    assert main.process_user_selection("p").include?("new game")
  end


end
