require 'wunderful'
require "api_token"

describe Wunderful::Weather do
  before do
    location = '40.77,93.98' # accepts a zipcode or lat/lng
    @weather = Wunderful::Weather.new(location)
  end

  it "should have an alerts array" do
    @weather.alerts.should be_an_instance_of Array
  end

  it "should have current observations" do
    @weather.conditions.should_not be_nil
  end
  
  it "should have location details" do
    @weather.city.should be_an_instance_of String
    @weather.state.should be_an_instance_of String
    @weather.lat.should be_an_instance_of Float
    @weather.lng.should be_an_instance_of Float
  end
end
