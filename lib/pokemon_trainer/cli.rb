class Cli
  def start
    puts "Hello and welcome to the world of Pokemon!"
    main_menu
  end

  def main_menu
    puts "Type 1 to create trainer"
    puts "Type 2 to view other trainers"
    puts "Type 3 to create Pokemon"
    puts "Type 4 to view Pokemon"
    puts "Type 5 to catch Pokemon!"
    puts "Type 'exit' to exit program"
    main_menu_input
  end

  def main_menu_input
    input = gets.strip

    if input == "1"
      puts "creating character"
      main_menu
    elsif input == "2"
      puts "viewing other trainer"
      main_menu
    elsif input == "3"
      puts "creating pokemon"
      main_menu
    elsif input == "4"
      puts "viewing all pokemon"
      main_menu
    elsif input == "5"
      puts "catching pokemon!"
      main_menu
    elsif input.downcase == "exit"
      goodbye
      exit
    else
      invalid_input
      main_menu
    end
  end

  def goodbye
    puts "Had a good adventure? Come again!"
  end

  def invalid_input
    puts "Wrong input! Please try again!"
  end
end