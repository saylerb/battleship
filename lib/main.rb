require "./lib/print"

class Main
  def display_main_menu
    Print.instructions
  end

  def get_user_selection
    get_user_selection(gets.chomp)
  end

  def process_user_selection(user_selection)
    case user_selection
    when "p"
      play_game
    when "i"
      Print.instructions
    when "q"
      exit
    else
      Print.invalid_input
    end
  end


  def computer_ship_placement
  end


  def play_game
    "playing"
  end
end



