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
    if self.all.empty?
      new_from_api
    else
      @@all
    end
  end

  def new_from_api
    api = MaBreweries::API.new
    results = breweries.each do |attributes_hash|
     self.new(attributes_hash)
     @@all << self
    end
    # end

  def self.all_names
    self.all.each_with_index do |brewery, i|
    puts "#{i+1}: #{brewery.name}"
    end
  end

  def self.find_by_name(name)
    self.all.detect {|brewery| brewery.name == name}
  end

  def self.find_by_brewery_type(brewery_type)
    self.all.collect {|brewery| brewery.brewery_type.downcase == brewery_type.downcase}
  end

  def self.find_by_street(street)
    self.all.select {|brewery| brewery.street == street}
  end

  def self.find_by_city(city)
    self.all.select {|brewery| brewery.city == city}
  end

end
