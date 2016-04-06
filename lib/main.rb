class Main
  def display_main_menu

    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
    get_user_selection(gets.chomp)
 
  end

  def get_user_selection(user_selection)
    case user_selection
    when "p"
      puts "new_game not yet implemented"
      # set 
    when "i"
      puts "display_instructions not yet implemented"
      # display_instructions
    when "q"
      exit
    else
      puts "Sorry, that is not a valid choice."
    end
  end

end


main = Main.new
main.display_main_menu
