require 'helper'

class TestWunderful < Test::Unit::TestCase
  context "on initialization of a Wunderful object" do
    setup do
      Wunderful::API_KEY = ENV['API_KEY']
      zip = ENV['ZIP'] || '11231'
      features = ["geolookup", "astronomy"]
      @weather = Wunderful.new(zip, features)
    end

    should "return a key value" do
      assert @weather.report['forecast']
      assert @weather.report['alerts']
    end

    should "return a report" do
      assert @weather.report
    end

    should "have a forecast" do
      assert @weather.forecast
    end

    should "have alerts" do
      assert @weather.alerts
    end

     should "have conditions" do
      assert @weather.conditions
    end
  end
end
