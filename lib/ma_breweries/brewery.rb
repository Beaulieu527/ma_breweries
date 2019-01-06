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

  def self.find_by_name(name)
    self.all.detect {|brewery| brewery.name == name}
  end

  def self.find_by_brewery_type(brewery_type)
    self.all.select {|brewery| brewery.brewery_type == brewery_type}
  end

  def self.find_by_street(street)
    self.all.select {|brewery| brewery.street == street}
  end

  def self.find_by_city(city)
    self.all.select {|brewery| brewery.city == city}
  end

  def brew_info
    puts "Brewery Name: #{self.name}"
    puts "Adress: #{self.street} #{self.city} #{self.state}, #{self.postal_code} #{self.country}"
    puts "Phone Number: #{self.phone}"
    puts "Website: #{self.website_url}"
  end
end
