class Wunderful
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator install the Wunderful gem with an initializer in config/initializers/wunderful.rb"
      
      argument :api_key, :type => :string, :default => "YOUR_API_KEY", :banner => "YOUR_API_KEY"

      def create_initializer_file
        template 'initializer.rb', "config/initializers/wunderful.rb", :api_key => options[:api_key]
      end
    end
  end
end
