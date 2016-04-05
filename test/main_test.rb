require 'minitest/autorun'
require 'minitest/pride'
require 'test_helper'
require './lib/main'

class MainTest < Minitest::Test
    def test_if_main_exists
      main = Main.new
      assert main
    end

end
