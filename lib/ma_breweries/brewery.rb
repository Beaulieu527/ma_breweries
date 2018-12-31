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
binding.pry
  def self.all
    @@all
  end

end
