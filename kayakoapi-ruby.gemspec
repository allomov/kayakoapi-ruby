# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kayakoapi-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "kayakoapi-ruby"
  gem.version       = Kayakoapi::VERSION
  gem.authors       = ["Peter Mellett"]
  gem.email         = ["bulletraven@gmail.com"]
  gem.description   = %q{Ruby Shoes app to generate Kayako API URLs.}
  gem.summary       = %q{Ruby Shoes app to generate Kayako Resolve API URLs.}
  gem.homepage      = "http://petermellett.co.uk/projects/kayakoapi"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
