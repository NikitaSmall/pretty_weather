module PrettyWeather
  class Configuration
    attr_accessor :city_param, :units, :mode

    def initialize
      @city_param = 'london'
      @units = 'metric'
      @mode = 'city_name'
    end

    def set_options(&block)
      block.yield(self)
    end
  end
end