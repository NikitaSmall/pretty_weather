$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pretty_weather/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pretty_weather"
  s.version     = PrettyWeather::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PrettyWeather."
  s.description = "TODO: Description of PrettyWeather."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "nokogiri"
  s.add_dependency "weather-icons-rails"

  s.add_development_dependency "sqlite3"
end
