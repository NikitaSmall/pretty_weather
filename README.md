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
  options.city_param = 'london'
  options.units = 'imperial'
end
```
From now pretty weather gem will specify London as default city for weather helpers with fahrenheit default temperature scale.
Also you may specify mode to get your city weather. For this you should write the 'mode' option like this:

```ruby
Rails.application.config.pretty_weather.set_options do |options|
  options.city_param = '698740'
  options.units = 'metric'
  options.mode = 'id'
end
```

You may choose one of the following modes: 'id' or 'city_name'. The default mode value is 'city_name'.
For correct city_id search on openweathermap site.

## Usage

It is pretty easy to know the current weather at your home city!
You may use the defaults helpers or make your own (using the 'Weather' class).
There are three helpers, that will describe the weather:

1. weather_temp - this helper will show the string with temperature.

```ruby
<%= weather_temp %> #=> '+13'
```

2. weather_condition - this helper will shortly describe the weather state.

```ruby
<%= weather_condition %> #=> 'cloud'
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
# here you can't use default options and you should specify city, scale and mode .
@weather = PrettyWeather::Weather.new('odesa', 'metric', 'city_name')
```
For now in @weather object a lot of different information.
In this object you can find:

```ruby
@weather = PrettyWeather::Weather.new('jerusalem', 'metric')
@weather.temp # this will give you access to string with temperature state; like '+22'.
@weather.weather # this will give you access to string with short weather description; like 'cloud'.
@weather.icon_tag # this will give you access to string with tag, that you can place into your view; like '<i class="wi wi-cloudy"></i>'.
@weather.temp_numeric # this takes a float number with current temperature state; like '16.536'.
@weather.city_name # this will give you access to city_name with current weather. Also you may change city to update your current position.
@weather.units # this will give you access to units of temperature scale. Also you may change units to update your scale.
@weather.updated_at # this will show you a moment with last connection to the openweather server.
@weather.mode # this will return current mode (like 'id' or 'city_name')
```

Also you may update your information without recreating new object. To update information do:

```ruby
# here you can't use default options and you should specify city and scale.
@weather = PrettyWeather::Weather.new('odesa', 'metric')
@weather.collect_data # this will update object
@weather.collect_data('odessa', 'imperial') # this will update object with new city and scale (information about new city or scale will not be saved!)
```


## Contributing

1. Fork it ( https://github.com/nikitasmall/pretty_weather/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
