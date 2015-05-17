$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pretty_weather/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pretty_weather"
  s.version     = PrettyWeather::VERSION
  s.authors     = ["NikitaSmall"]
  s.email       = ["nikitasosnov@yahoo.com"]
  s.homepage    = "https://github.com/NikitaSmall/pretty_weather"
  s.summary     = "Gem for easy implementation for openweather api"
  s.description = "Pretty_weather is a gem for easy implementation for openweather api with pretty icons for current weather at specific location"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "nokogiri"
  s.add_dependency "weather-icons-rails"

  s.add_development_dependency "sqlite3"
end
