class MaBreweries::BREWERY

  attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url
  @@all = []
  @@sorted = nil
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

  def self.all_names
    self.all.each_with_index do |brewery, i|
    puts "#{i+1}: #{brewery.name}"
    end
  end

  def self.find_by_name(name)
    self.all.detect {|brewery| brewery.name.downcase == name.downcase}

  end

  def self.find_by_brewery_type(brewery_type)
    self.all.select {|brewery| brewery.brewery_type.downcase == brewery_type.downcase}
  end

  # def self.find_by_street(street)
  #   self.all.select {|brewery| brewery.street.downcase == street.downcase}
  # end

  def self.find_by_city(city)
    self.all.select {|brewery| brewery.city.downcase == city.downcase}
  end

  def self.all_names
    self.all_sorted.each_with_index do |brewery, i|
    puts "#{i+1}: #{brewery.name}"
    end
  end

  def self.all_sorted
     @@sorted ||= self.all.sort!{ |a,b| a.name <=> b.name }
    # if @@sorted
    #   @@sorted
    # else
    #   @@sorted = self.all.sort!{ |a,b| a.name <=> b.name }
    # end
  end

  def brew_info
    puts "Brewery Name: #{self.name}"
    puts "Brewery Type: #{self.brewery_type}"
    puts "Adress: #{self.street} #{self.city} #{self.state}, #{self.postal_code} #{self.country}"
    puts "Phone Number: #{self.phone}"
    puts "Website: #{self.website_url}"
  end

end
