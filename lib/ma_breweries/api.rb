require 'pry'
require 'open-uri'
require 'json'

class MaBreweries::API
  @all_brews = []

  def initialize

    i = 1

    while i <= 4 do
      page = open("https://api.openbrewerydb.org/breweries?by_state=Massachusetts&per_page=50&page=#{i+=1}")
      breweries = JSON.parse(page.read)
      breweries.each do |attributes_hash|
       MaBreweries::BREWERY.new(attributes_hash)
      end
    end
    @all_brews << self
  end
  binding.pry

end
