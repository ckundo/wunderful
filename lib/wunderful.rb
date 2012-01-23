require 'httparty'
require 'pp'

class Wunderful
  include HTTParty
  base_uri 'http://api.wunderground.com'
  format :json

  def initialize(zip)
    @zip = zip
    @api_key = Wunderful::API_KEY
  end

  def alerts
    @alerts ||= self.class.get("/api/#{@api_key}/alerts/q/#{@zip}.json")['alerts']
  end
end
