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

  test "weather_state_should_be_not_less_than_four_length_string" do
    assert_kind_of String, @weather.weather
    assert @weather.weather.length >= 4
  end

  test "weather_icon_should_be_a_string_with_tag_i" do
    assert_kind_of String, @weather.icon_tag
    assert @weather.icon_tag.index('<i') >= 0
    assert @weather.icon_tag.index('</i>') >= 0
  end
end
