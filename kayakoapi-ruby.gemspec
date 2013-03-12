# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kayakoapi-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "kayakoapi-ruby"
  gem.version       = Kayakoapi::VERSION
  gem.authors       = ["Peter Mellett"]
  gem.email         = ["bulletraven@gmail.com"]
  gem.description   = %q{Library to generate Kayako Resolve API Querystrings.}
  gem.summary       = %q{Library to generate Kayako Resolve API Querystrings.}
  gem.homepage      = "https://github.com/wadtech/kayakoapi-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", ["~> 2.12"]
end
