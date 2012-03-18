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

  #it "should have current observations" do
    #@weather.conditions.should_not be_nil
  #end
  
  #it "should have location details" do
    #@weather.city.should be_an_instance_of String
    #@weather.state.should be_an_instance_of String
    #@weather.lat.should be_an_instance_of Float
    #@weather.lng.should be_an_instance_of Float
  #end

  context 'an alert' do
    before do
      @alert = @weather.alerts.first
    end

    it 'should have a location' do
      @alert.latitude.should be_an_instance_of Float
      @alert.longitude.should be_an_instance_of Float
      @alert.area.should be_an_instance_of String
    end

    it 'should have an event category' do
      # Geo, Met, Safety, Security, Rescue, Fire, Health, Env, Transport, Infra, CBRNE, Other
    end

    # Tornado Watch, Hurricane Watch, etc
    it 'should have an event description' do
      @alert.description.should be_an_instance_of String
      @alert.description.should_not be_empty
    end

    it 'should have a summary' do
      @alert.summary.should be_an_instance_of String
      @alert.summary.should_not be_empty
    end

    it 'should have an onset time' do
      @alert.time_effective.should be_an_instance_of DateTime
    end

    it 'should have instructions' do
      @alert.instructions.should be_an_instance_of String
      @alert.instructions.should_not be_empty
    end

    it 'should have an expiration time' do
      @alert.time_expires.should be_an_instance_of DateTime
    end

    # indicates time to take action
    # now, next hour, soon, no action required, unknown
    it 'should have a level of urgency' do
      # immediate, expected future, past, unknown
    end

    # indicates threat to life and property
    # extraordinary threat, significant threat, possible threat, minimal threat, unknown
    it 'should have a level of severity' do
      # extreme, severe, moderate, minor, unknown
    end

    # happening/happened, prob ~ 100%, prob > 50%, prob ~ 0
    it 'should have a level of certainty' do
      # observed, expected, likely, unlikely
    end

  end
end
