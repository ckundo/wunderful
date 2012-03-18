require 'httparty'

module Wunderful
  class Weather
    include HTTParty
    base_uri 'http://api.wunderground.com'
    format :json

    attr_reader :alerts, :conditions

    def initialize(zip, *args)
      @zip = zip
      @features = %w{ conditions alerts } + args
      @features.flatten!
      report = self.class.get("/api/#{Wunderful::API_TOKEN}/#{@features.join('/')}/q/#{@zip}.json")

      @alerts = report['alerts']
      @conditions = report['current_observation']
    end
  end
end
