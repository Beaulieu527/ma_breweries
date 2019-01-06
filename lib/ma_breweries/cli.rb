class MaBreweries::CLI

  def call
    puts "Welcome to your one stop search or all of your local breweries"
    puts "Do you want to know where the brews are?"
    puts "I can help you search but you will have to share!"
    menu
    brew_input = gets.chomp.downcase

    while (brew_input != exit)
      case brew_input
      when "name"
        search_breweries_by_name
      when "type"
        search_breweries_by_type
      when "street"
        search_breweries_by_street
      when "city"
        search_breweries_by_city
      when "let the beer flow"
        show_all_breweries
      when "i had to much"
      else
        puts "I am sorry you won't find any brews that way!"
      end

      menu

      brew_input = gets.chomp.downcase
    end
    puts "Peace out! Have fun and drive carefully!"
  end

  def menu
      puts "There are many ways fo you to search."
      puts "1. To search by brewery name please enter - Name"
      puts "2. To search by brewery type please enter - Type"
      puts "3. To search by street name please enter - Street"
      puts "4. To search by city please enter - City"
      puts "5. To list all the breweries by name please enter - Let the beer flow"
      puts "6. to exit please enter - I had to much"
    end

  end

end
