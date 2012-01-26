require 'httparty'
require 'pp'

class Wunderful
  include HTTParty
  base_uri 'http://api.wunderground.com'
  format :json

  attr_accessor :features

  def initialize(zip, *args)
    @zip = zip
    @features = %w{ geolookup forecast alerts } + args
    @report = self.class.get("/api/#{Wunderful::API_KEY}/#{@features.join('/')}/q/#{@zip}.json")
  end

  def forecasts
    @forecast ||= @report['forecast']
  end

  def alerts
    @alerts ||= @report['alerts']
  end

end
