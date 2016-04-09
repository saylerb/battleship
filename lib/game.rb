require "./lib/board.rb"
require "./lib/ship.rb"

class Game
  attr_reader :playing

  def initialize
    @playing = false
    @game_over = false
    @computer_board = Board.new
    @human_board = Board.new
    @random_generator = Random.new
  end

  def play
    @playing = true
    @game_over = false

    set_computer_board
    set_human_board

    until @game_over
      guess_sequence
      if all_my_ships_are_belong_to_computer
        @game_over = true
      elsif all_computer_ships_are_belong_to_human
        @game_over = true
      else
        puts "Keep playing!"
      end
    end
  end

  def set_computer_board
    comp_x1 = @random_generator.rand(4)
    comp_y1 = @random_generator.rand(4)
    puts "computer's 1st ship position: (#{comp_x1},#{comp_y1})"
    @computer_board.add_ship([comp_x1,comp_y1])

    valid = false
    until valid
      comp_x2 = @random_generator.rand(4)
      comp_y2 = @random_generator.rand(4)
      puts "computer's 2nd ship position: (#{comp_x2},#{comp_y2})"
      @computer_board.add_ship([comp_x2,comp_y2])
      if (comp_x1 != comp_x2) || (comp_y1 != comp_y2)
        valid = true
      end
    end
    puts Print.ship_placement_instructions
  end

  def set_human_board
    print "enter x1: "
    x1 = gets.chomp.to_i
    print "enter y1: "
    y1 = gets.chomp.to_i

    @human_board.add_ship([x1,y1])

    print "enter x2: "
    x2 = gets.chomp.to_i
    print "enter y2: "
    y2 = gets.chomp.to_i

    if (x1 != x2) || (y1 != y2)
        human_valid = true
    end
    @human_board.add_ship([x2,y2])
    puts "boards are set!(?) ready to play!"
  end

  def guess_sequence

    puts "COMPUTER:"
    @computer_board.display_grid
    puts "HUMAN:"
    @human_board.display_grid
    # user_input = gets.chomp
    # check_user_input(user_input)

    print "Enter a x: "
    user_input_x = gets.chomp
    print "Enter a y: "
    user_input_y = gets.chomp

    puts "TODO: check computer board for hits"

  end
end
