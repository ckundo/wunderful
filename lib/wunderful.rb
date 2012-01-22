require 'httparty'

class Wunderful
  autoload :Generator, 'wunderful/generator'

  include HTTParty
  base_uri "api.wunderful.com"
  
  attr_reader :zip
  
  def initialize(zip)
    @zip = zip
  end

  def alerts
    @alerts ||= self.class.get("/api/#{APP_CONFIG[:wunderground_api_key]}/alerts/q/#{@zip}", :format => :json).alerts
  end
end
