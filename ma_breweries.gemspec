
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ma_breweries/version"

Gem::Specification.new do |spec|
  spec.name          = "ma_breweries"
  spec.version       = MaBreweries::VERSION
  spec.authors       = ["'Justin Beaulieu'"]
  spec.email         = ["'beaulieudev@gmail.com'"]

  spec.summary       = %q{Cli for displaying all local breweries in Mass.}
  spec.description   = %q{Brewery search that allows you to find all of the local Massachusetts breweries. You are able to list all of the breweries by name in a numbered list. Also you can search all of the breweries by Name, Brewery type, and City. This CLI project is based on the Open Brewery DB API.}
  spec.homepage      = "https://github.com/Beaulieu527/ma_breweries"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #
  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["ma_breweries"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "gem-release"

end
