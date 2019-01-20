require "pry"
require "open-uri"
require "json"
require_relative "./ma_breweries/version"
require_relative "./ma_breweries/brewery"
require_relative "./ma_breweries/cli"
require_relative "./ma_breweries/breweries_api"


module MaBreweries
  class Error < StandardError; end
  # Your code goes here...
end
