require 'helper'

class TestWunderful < Test::Unit::TestCase
  context "on initialization of a Wunderful object" do
    setup do
      Wunderful::API_KEY = ENV['API_KEY']
      zip = ENV['ZIP'] || '11231'
      @weather = Wunderful.new(zip)
    end
    
    should "return a forecast" do
      assert @weather.forecast != nil
    end

    should "return an array of alerts" do
      assert @weather.alerts.kind_of?(Array)
    end
  end
end
