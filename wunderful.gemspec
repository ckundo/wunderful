# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wunderful/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cameron Cundiff"]
  gem.email         = ["ckundo@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wunderful"
  gem.require_paths = ["lib"]
  gem.version       = Wunderful::VERSION
  
  gem.add_dependency('httparty', '~> 0.8.1')
  gem.add_development_dependency('rspec', '~> 2.9.0')
end
