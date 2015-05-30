module PrettyWeather
  def weather_tag(city = Rails.application.config.pretty_weather.city_param, units = Rails.application.config.pretty_weather.units, mode = Rails.application.config.pretty_weather.mode)
    Weather.new(city, units, mode).icon_tag
  end

  def weather_temp(city = Rails.application.config.pretty_weather.city_param, units = Rails.application.config.pretty_weather.units, mode = Rails.application.config.pretty_weather.mode)
    Weather.new(city, units, mode).temp
  end

  def weather_condition(city = Rails.application.config.pretty_weather.city_param, units = Rails.application.config.pretty_weather.units, mode = Rails.application.config.pretty_weather.mode)
    Weather.new(city, units, mode).weather
  end
end