require 'open-uri'
require 'nokogiri'

module PrettyWeather
  class PrettyWeather
    attr_accessor :temp, :weather, :icon_tag

    def initialize(city_name)
      link = "http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&mode=xml&units=metric" #Odesa for Odessa in Ukraine
      attempts = 3

      begin
        data = Nokogiri::XML(open(link))

        @temp = data.xpath('//temperature')[0]['value'].to_i.to_s
        weather_code = data.xpath('//weather')[0]['icon']

        @temp = "+#{@temp}" unless @temp.index('-')
        @weather = weather_name(weather_code)

        @icon_tag = select_weather_icon @weather
      rescue OpenURI::HTTPError => e
        attempts -= 1
        retry unless attempts.zero?
      end
    end

    def weather_name(weather_code)
      case weather_code
        when '01d'
          'sunny'
        when '01n'
          'moonly'
        when '02d'
          'day_cloud'
        when '02n'
          'night_cloud'
        when '50d', '50n'
          'foggy'
        when '10d'
          'day_rain'
        when '10n'
          'night_rain'
        when '09d', '09n'
          'heavy_rain'
        when '13d', '13n'
          'snow'
        when '11d', '11n'
          'thunder'
        when '03d', '03n', '04d', '04n'
          'cloud'
        else
          'good'
      end
    end

    def select_weather_icon(weather)
      icon = case weather
               when 'sunny'
                 '<i class="wi wi-day-sunny"></i>'
               when 'moonly'
                 '<i class="wi wi-night-clear"></i>'
               when 'day_cloud'
                 '<i class="wi wi-day-cloudy"></i>'
               when 'night_cloud'
                 '<i class="wi wi-night-alt-cloudy"></i>'
               when 'foggy'
                 '<i class="wi wi-dust"></i>'
               when 'day_rain'
                 '<i class="wi wi-day-showers"></i>'
               when 'night_rain'
                 '<i class="wi wi-night-alt-sprinkle"></i>'
               when 'heavy_rain'
                 '<i class="wi wi-sprinkle"></i>'
               when 'windy'
                 '<i class="wi wi-cloudy-gusts"></i>'
               when 'snow'
                 '<i class="wi wi-snow"></i>'
               when 'thunder'
                 '<i class="wi wi-thunderstorm"></i>'
               when 'cloud'
                 '<i class="wi wi-cloudy"></i>'
               when 'good'
                 '<i class="wi wi-thermometer-exterior"></i>'
               else
                 '<i class="wi wi-cloud-refresh"></i>'
             end
      icon.html_safe
    end
  end
end
