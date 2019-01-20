class MaBreweries::BreweriesAPI

  def self.get_breweries
    boolean = true
    i = 1
    while boolean do
      page = open("https://api.openbrewerydb.org/breweries?by_state=Massachusetts&per_page=50&page=#{i}")
      i+=1
      breweries = JSON.parse(page.read)
      if breweries.count == 0
        boolean = false
      else
        breweries.each do |attributes_hash|
          MaBreweries::BREWERY.new(attributes_hash)
        end
      end
    end

  end

end
