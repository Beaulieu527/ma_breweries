class MaBreweries::BREWERY

  attr_accessor :name :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url
  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

end
