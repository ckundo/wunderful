require 'httparty'
require 'pp'

class Wunderful
  include HTTParty
  base_uri 'http://api.wunderground.com'
  format :json

  attr_accessor :features

  def initialize(zip, *args)
    @zip = zip
    @features = %w{ conditions forecast alerts } + args
    @report = self.class.get("/api/#{Wunderful::API_KEY}/#{@features.join('/')}/q/#{@zip}.json")
  end

  def forecast
    @forecast ||= @report['forecast']
  end

  def alerts
    @alerts ||= @report['alerts']
  end

end
