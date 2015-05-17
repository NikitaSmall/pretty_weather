module PrettyWeather
  def weather_tag(city = Rails.application.config.pretty_weather.city_name, units = Rails.application.config.pretty_weather.units)
    Weather.new(city, units).icon_tag
  end

  def weather_temp(city = Rails.application.config.pretty_weather.city_name, units = Rails.application.config.pretty_weather.units)
    Weather.new(city, units).temp
  end

  def weather_condition(city = Rails.application.config.pretty_weather.city_name, units = Rails.application.config.pretty_weather.units)
    Weather.new(city, units).weather
  end
end