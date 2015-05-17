# PrettyWeather

A little gem to use OpenWeather api. It is pretty simple to show current weather on your site!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pretty_weather'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pretty_weather

Next, you may set initializer for default city to know the current weather in it.
Also you may specify units: metric for celsius, imperial for fahrenheit, or '' for kelvin temperature scale.
Place the 'pretty_weather.rb' at 'config/initializers/pretty_weather.rb' and write these strings:

```ruby
Rails.application.config.pretty_weather.set_options do |options|
options.city_name = 'london'
options.units = 'imperial'
end
```

From now pretty weather gem will specify London as default city for weather helpers with fahrenheit default temperature scale.

## Usage

It is pretty easy to know the current weather at your home city!
You may use the defaults helpers or make your own (using the 'Weather' class).
There are three helpers, that will describe the weather:

1. weather_temp - this helper will show the string with temperature.

```ruby
<%= weather_temp %> #=> '+13'
# to rewrite default city_name;
<%= weather_temp 'odesa' %>
# you also may add second param to rewrite temperature scale
<%= weather_temp 'odesa', 'metric' %>
```

2. weather_condition - this helper will shortly describe the weather state.

```ruby
<%= weather_condition %> #=> 'cloud'
# to rewrite default city_name;
<%= weather_condition 'odesa' %> #=> 'thunder'
```

3. weather_tag - this helper will work properly in case if you will install this gem:
[Weather-icons-rails](https://github.com/CodySchaaf/weather-icons-rails)
If you will do this you will get a pretty icon in result of helper work:

```ruby
<%= weather_tag %> #=> pretty_icon is appeared
```

But if you want, you may use Weather class with your own ideas and helpers.
To create Weather object, for example, in controller, use:

```ruby
# here you can't use default options and you should specify city and scale.
@weather = PrettyWeather::Weather.new('odesa', 'metric')
```

## Contributing

1. Fork it ( https://github.com/nikitasmall/pretty_weather/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
