module PrettyWeather
  class Configuration
    attr_accessor :city_name, :units

    def initialize
      @city_name = 'london'
      @units = 'metric'
    end

    def set_options(&block)
      block.yield(self)
    end
  end
end