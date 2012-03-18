# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wunderful/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cameron Cundiff"]
  gem.email         = ["ckundo@gmail.com"]
  gem.description   = %q{A Ruby gem wrapper for the Weather Underground API.}
  gem.summary       = %q{Wunderful uses the Weather Underground API to return severe weather alerts and current conditions based on a zip code.}
  gem.homepage      = "http://github.com/ckundo/wunderful"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wunderful"
  gem.require_paths = ["lib"]
  gem.version       = Wunderful::VERSION
  
  gem.add_dependency('httparty', '~> 0.8.1')
  gem.add_development_dependency('rspec', '~> 2.9.0')
end
