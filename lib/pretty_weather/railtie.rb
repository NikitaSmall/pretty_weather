class Railtie < Rails::Railtie
  initializer 'pretty_weather.initialize_pretty_weather_helper' do |app|
    ActiveSupport.on_load(:action_view) do
      include PrettyWeather
    end
  end

  initializer 'pretty_weather.configuration' do |app|
    app.config.pretty_weather = PrettyWeather::Configuration.new
  end
end