require 'httparty'

class Wunderful
  autoload :Generator, 'wunderful/generator'

  include HTTParty
  base_uri BASE_URI
  
  attr_reader :zip
  
  def initialize(zip)
    @zip = zip
  end

  def alerts
    @alerts ||= self.class.get("/api/#{API_KEY}/alerts/q/#{@zip}", :format => :json).alerts
  end
end
