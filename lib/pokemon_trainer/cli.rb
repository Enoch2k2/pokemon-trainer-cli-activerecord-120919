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
      create_trainer
      main_menu
    elsif input == "2"
      list_trainers
      trainer_sub_menu
    elsif input == "3"
      create_pokemon
      main_menu
    elsif input == "4"
      list_pokemons
      pokemon_sub_menu
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

  def trainer_sub_menu
    puts ""
    puts "Which Trainer Would you like to know more about? (Choose Number Associated With Trainer)"
    puts "type 'menu' for main menu"
    puts "type 'exit' to exit program"
    trainer_sub_menu_options
  end

  def pokemon_sub_menu
    puts ""
    puts "Which Pokemon Would you like to know more about? (Choose Number Associated With Pokemon)"
    puts "type 'menu' for main menu"
    puts "type 'exit' to exit program"
    pokemon_sub_menu_options
  end

  def trainer_sub_menu_options
    input = gets.strip

    if input.downcase == "exit"
      goodbye
      exit
    elsif input.downcase == "menu"
      main_menu
    elsif input.to_i.between?(1, Trainer.all.length)
      trainer_details(input.to_i - 1)
      main_menu
    else
      invalid_input
      trainer_sub_menu
    end
  end

  def pokemon_sub_menu_options
    input = gets.strip

    if input.downcase == "exit"
      goodbye
      exit
    elsif input.downcase == "menu"
      main_menu
    elsif input.to_i.between?(1, Pokemon.all.length)
      pokemon_details(input.to_i - 1)
      main_menu
    else
      invalid_input
      pokemon_sub_menu
    end
  end

  def create_trainer
    puts ""
    puts "What is your trainer name?"
    name = gets.strip
    trainer = Trainer.new(name: name)
    if trainer.save
      puts "#{trainer.name} has been created."
      puts ""
    else
      puts "Something went wrong, try again"
      puts ""
      main_menu
    end
  end

  def create_pokemon
    puts ""
    puts "What is your pokemon name?"
    name = gets.strip
    puts "What is your pokemon type 1?"
    poke_type_1 = gets.strip
    puts "What is your pokemon type 2?"
    poke_type_2 = gets.strip
    puts "What is your pokemon description?"
    description = gets.strip
    pokemon = Pokemon.new(name: name, poke_type_1: poke_type_1, poke_type_2: poke_type_2, description: description)
    if pokemon.save
      puts "#{pokemon.name} has been created."
      puts ""
    else
      puts "Something went wrong, try again"
      puts ""
      main_menu
    end
  end

  def list_trainers
    puts ""
    puts "### LISTING TRAINERS ###"
    Trainer.all.each.with_index(1) do |trainer, i|
      puts "#{i}. #{trainer.name}"
    end
    puts ""
  end

  def list_pokemons
    puts ""
    puts "### LISTING Pokemon ###"
    Pokemon.all.each.with_index(1) do |pokemon, i|
      puts "#{i}. #{pokemon.name}"
    end
    puts ""
  end

  def trainer_details(index)
    trainer = Trainer.all[index]
    puts ""
    puts "### TRAINER DETAILS ###"
    puts "-----------------------"
    puts "Name: #{trainer.name}"
    puts "Num. Of Pokemon: TODO"
    puts ""
  end

  def pokemon_details(index)
    pokemon = Pokemon.all[index]
    puts ""
    puts "### POKEMON DETAILS ###"
    puts "-----------------------"
    puts "Name: #{pokemon.name}"
    puts "TYPE 1: #{pokemon.poke_type_1}"
    puts "TYPE 2: #{pokemon.poke_type_2}"
    puts "DESCRIPTION: #{pokemon.description}"
    puts ""
  end

  def goodbye
    puts "Had a good adventure? Come again!"
  end

  def invalid_input
    puts "Wrong input! Please try again!"
  end
end