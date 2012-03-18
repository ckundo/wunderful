require 'wunderful'
require "api_token"

describe Wunderful::Weather do
  before do
    zip = '10012'
    @weather = Wunderful::Weather.new(zip)
  end

  it "should have an alerts array" do
    @weather.alerts.should be_an_instance_of Array
  end

  it "should have current observations" do
    @weather.conditions.should_not be_nil
  end
end
