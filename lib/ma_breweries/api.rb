require 'pry'
require 'open-uri'
require 'json'

class MaBreweries::API

  def initialize
    page = open("https://api.openbrewerydb.org/breweries?by_state=Massachusetts&per_page=50&page=1")
    breweries = JSON.parse(page.read)
    breweries.each do |attributes_hash|
     MaBreweries::BREWERY.new(attributes_hash)
    end
  end

end
