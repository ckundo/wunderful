require 'httparty'
class Wunderful

  autoload :Generator, 'wunderful/generator'
  include HTTParty
  
  attr_reader :zip
  
  def initialize(zip)
    base_uri Wunderful::BASE_URI
    @zip = zip
  end

  def alerts
    @alerts ||= self.class.get("/api/#{Wunderful::API_KEY}/alerts/q/#{@zip}", :format => :json).alerts
  end
end
