require 'test_helper'

class PrettyWeatherTest < ActiveSupport::TestCase
  setup do
    @weather = PrettyWeather::PrettyWeather.new('odesa')
  end

  test "truth" do
    assert_kind_of Module, PrettyWeather
  end

  test "weather_temp_should_be_a_number" do
    assert_kind_of String, @weather.temp
  end
end
