require 'httparty'

module Wunderful
  class Weather
    include HTTParty
    base_uri 'http://api.wunderground.com'
    format :json

    attr_reader :report, :alerts, :lat, :lng

    def initialize(zip, *args)
      @zip = zip
      @features = %w{ geolookup alerts } + args
      @features.flatten!
      @report = self.class.get("/api/#{Wunderful::API_TOKEN}/#{@features.join('/')}/q/#{@zip}.json")

      @lat = report['location']['lat'].to_f
      @lng = report['location']['lon'].to_f

      @alerts = report['alerts']
    end
  end
end
