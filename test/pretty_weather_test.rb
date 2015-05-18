require 'test_helper'

require 'pretty_weather'

class PrettyWeatherTest < ActiveSupport::TestCase
  setup do
    @weather = PrettyWeather::Weather.new('odesa', 'metric')
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

  test "collect_weather_should_update_weather_state" do
    old_time = @weather.updated_at

    @weather.collect_data
    new_time = @weather.updated_at

    assert_not_equal old_time, new_time
  end
end
