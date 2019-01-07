require 'pry'
require 'open-uri'
require 'json'

class MaBreweries::CLI

  def initialize()
    page = open("https://api.openbrewerydb.org/breweries?by_state=Massachusetts&per_page=50&page=1")
    breweries = JSON.parse(page.read)
     breweries.each do |attributes_hash|
      MaBreweries::BREWERY.new(attributes_hash)
    end
  end

  def call
    puts "Welcome to your one stop search or all of your local breweries"
    puts "Do you want to know where the brews are?"
    puts "I can help you search but you will have to share!"
      menu
    brew_input = gets.chomp
    while (brew_input != "exit")
      if brew_input == "name"
        search_breweries_by_name
      elsif brew_input == "type"
        search_breweries_by_type
      elsif brew_input == "street"
        search_breweries_by_street
      elsif brew_input == "city"
        search_breweries_by_city
      elsif brew_input == "let the beer flow"
        show_all_breweries
      else
        puts "I am sorry you won't find any brews that way!"
      end
      menu
      brew_input = gets.chomp
    end
    puts "Peace out! Have fun and drive carefully!"
  end

   def menu
     puts "There are many ways fo you to search."
     puts "To search by brewery name please enter - Name"
     puts "To search by brewery type please enter - Type"
     puts "To search by street name please enter - Street"
     puts "To search by city please enter - City"
     puts "To list all the breweries by name please enter - Let the beer flow"
     puts "To exit please enter - exit"
   end

   def search_breweries_by_name
     puts "Please enter the brewery name: "
     input = gets.chomp
     brewery = MaBreweries::BREWERY.find_by_name(input)
     if brewery
       brewery.brew_info
     end
   end

   def search_breweries_by_type
     puts "Please enter the brewery type: "
     input = gets.chomp
     brewery = MaBreweries::BREWERY.find_by_brewery_type(input)
     if brewery
       brewery.brew_info
     end
   end

   def search_breweries_by_street
     puts "Pease enter the street you think the brews are on:"
     input = gets.chomp
     brewery = MaBreweries::BREWERY.find_by_street(input)
     if brewery
       brewery.brew_info
     end
   end

   def search_breweries_by_city
     puts "Please enter the city you would like to search in:"
     input = gets.chomp
     brewery = MaBreweries::BREWERY.find_by_city(input)
     if brewery
       brewery.brew_info
     end
   end

   def show_all_breweries
     MaBreweries::BREWERY.all_names
   end

   def brew_info
     puts "Brewery Name: #{brewery.name}"
     puts "Brewery Type: #{brewery.brewery_type}"
     puts "Adress: #{brewery.street} #{brewery.city} #{brewery.state}, #{brewery.postal_code} #{brewery.country}"
     puts "Phone Number: #{brewery.phone}"
     puts "Website: #{brewery.website_url}"
   end

end
