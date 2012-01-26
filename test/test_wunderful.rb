require 'helper'

class TestWunderful < Test::Unit::TestCase
  context "on initialization of a Wunderful object" do
    setup do
      Wunderful::API_KEY = ENV['API_KEY']
      zip = ENV['ZIP'] || '11231'
      @weather = Wunderful.new(zip)
    end

    should "return a report" do
      assert @weather
    end

    should "have forecasts" do
      assert @weather.forecasts
    end

    should "have alerts" do
      assert @weather.alerts
    end

  end
end
