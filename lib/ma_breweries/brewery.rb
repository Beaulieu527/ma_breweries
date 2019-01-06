class MaBreweries::BREWERY

  attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url
  @@all = []

  def initialize(attributes)
    attributes.each do |key, value|
      if self.respond_to?(key)
        self.send(("#{key}="), value)
      end
    end
   @@all << self
  end

  def self.all
    @@all
  end

  def self.search_by_name(name)
    self.all.detect {|brewery| brewery.name == name}
  end

  def self.serch_by_brewery_type(brewery_type)
  end

  def self.search_by_street(street)
  end

  def self.search_by_city(city)
  end


end
