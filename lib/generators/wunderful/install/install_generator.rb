class Wunderful
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator install the Wunderful gem with an initializer in config/initializers/wunderful.rb"
      
      argument :api_key, :type => :string, :default => "", :banner => "YOUR_API_KEY"

      def create_initializer_file
        destination = "config/initializers/wunderful.rb"
        template 'initializer.rb', destination
        inject_into_file destination, :after => 'base_uri = "api.wunderground.com"' do
          "API_KEY = #{options[:api_key]}"
        end
      end
    end
  end
end
