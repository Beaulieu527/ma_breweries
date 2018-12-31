class MaBreweries::API

  def self.get_massachusetts_breweries
    page = open("https://api.openbrewerydb.org/breweries?by_state=Massachusetts&per_page=50&page=1")
    data = JSON.parse(page.read)
  end
  
end
