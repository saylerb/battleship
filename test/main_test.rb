require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/main'
require './lib/print'
require './lib/game'

class MainTest < Minitest::Test

  def setup
    @main = Main.new
  end

  def test_if_main_exists
    assert @main
  end

  def test_that_menu_controls_work
    assert @main.display_main_menu.include?("BATTLESHIP")
  end

  def test_that_game_starts_when_player_select_p
    game_status = @main.process_user_selection("p")
    assert game_status
  end


end
