require "./lib/print"
require "./lib/game"

class Main

  attr_accessor :current_game
  
  def initialize
    @current_game = nil
  end

end


while true
  main = Main.new
  puts Print.welcome

  user_selection = gets.chomp.downcase

  if user_selection == "p"
      main.current_game = Game.new
      if main.current_game.play
        puts "we are playing the game!"
      end
  elsif user_selection == "i"
      puts Print.instructions
  elsif user_selection == "q"
      puts "Sorry to see you go!"
      exit
  else
    puts Print.invalid_input
  end

end
