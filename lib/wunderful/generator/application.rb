require 'shellwords'

class Wunderful
  class Generator
    class Application
      class << self
        include Shellwords

        def run!(*arguments)
          options = build_options(arguments)

          if options[:invalid_argument]
            $stderr.puts options[:invalid_argument]
            options[:show_help] = true
          end

          if options[:show_help]
            $stderr.puts options.opts
            return 1
          end

          if options[:api_key].nil? || options[:api_key].squeeze.strip == ""
            $stderr.puts options.opts
            return 1
          end

          begin
            generator = Wunderful::Generator.new(options)
            generator.run
            return 0
          rescue Wunderful::NoWundergroundApiKey
            $stderr.puts %Q{No Wunderground API key.}
            return 1
          end
        end

        def build_options(arguments)
          env_opts_string = ENV['WUNDERFUL_OPTS'] || ""
          env_opts        = Wunderful::Generator::Options.new(shellwords(env_opts_string))
          argument_opts   = Wunderful::Generator::Options.new(arguments)

          env_opts.merge(argument_opts)
        end

      end

    end
  end
end
