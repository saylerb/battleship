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
      if all_human_ships_are_belong_to_computer
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

    @computer_board.display_grid

    puts Print.ship_placement_instructions
  end

  def set_human_board
    print "Please enter the squares for your first single-unit ship >>> "
    
    selection_one_coordinates = @human_board.convert_string_to_coord(gets.chomp)

    @human_board.add_ship(selection_one_coordinates)
    @human_board.display_grid


    print "Please enter the squares for your single-unit ship"

    selection_two_coordinates = @human_board.convert_string_to_coord(gets.chomp)

    # TODO: validate guess  @human_board.is_occupied?(selection_two)

    @human_board.add_ship(selection_two_coordinates)
    @human_board.display_grid
    puts "boards are set! Ready to play!"
  end

  def guess_sequence

    puts "COMPUTER:"
    @computer_board.display_grid
    puts "HUMAN:"
    @human_board.display_grid

    print "Please enter coorindates for your guess: "

    human_guess = @human_board.convert_string_to_coord(gets.chomp)

    if @computer_board.ships.any? { |ship| ship.coordinates == human_guess }
      puts "You hit computer's ship!"
      @computer_board.ships.find { |ship| ship.coordinates == human_guess}.hit_ship
      @computer_board.display_grid

    end

    puts "TODO: check computer board for hits"

  end
end
