require 'httparty'

module Wunderful
  class Weather
    include HTTParty
    base_uri 'http://api.wunderground.com'
    format :json

    attr_reader :alerts, :conditions, :state, :city, :lat, :lng

    def initialize(zip, *args)
      @zip = zip
      @features = %w{ geolookup conditions alerts } + args
      @features.flatten!
      report = self.class.get("/api/#{Wunderful::API_TOKEN}/#{@features.join('/')}/q/#{@zip}.json")

      @state = report['location']['state']
      @city = report['location']['city']
      @lat = report['location']['lat'].to_f
      @lng = report['location']['lon'].to_f

      @alerts = report['alerts']
      @conditions = report['current_observation']
    end
  end
end
