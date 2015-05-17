class HomeController < ApplicationController
  def index
    @weather = PrettyWeather::Weather.new('odesa', 'metric')
  end
end
