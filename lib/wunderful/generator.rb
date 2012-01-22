require 'git'
require 'erb'

require 'net/http'
require 'uri'

require 'fileutils'
require 'pathname'

class Wunderful
  class NoApiKey < StandardError
  end

  class FileAlreadyExists < StandardError
  end

  class Generator
    require 'wunderful/generator/options'
    require 'wunderful/generator/application'

    attr_accessor :api_key

    def initialize(options = {})
      self.options = options
      self.source_file = 'lib/wunderful/templates/initializer.rb'
      self.target_file = 'config/initializers/wunderful.rb'
      raise NoApiKey unless self.api_key
    end

    def run
      create_files
      $stdout.puts "Wunderful has generated an initializer in #{target_file}"
    end

  private
    def create_files
      unless File.exists?(target_file)
        source = File.read(source_file)
        source.gsub!(/API_KEY_VALUE/, self.api_key)
        
        File.open(target_file, 'w') {|file| file.write(source)}
        $stdout.puts "\tcreate\t#{target_file}"
      else
        raise FileAlreadyExists, "The file #{target_file} already exists, aborting. Maybe move it out of the way before continuing?"
      end
    end
  end
end
