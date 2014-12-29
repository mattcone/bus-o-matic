# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bus_rat/version'

Gem::Specification.new do |spec|
  spec.name          = "bus_rat"
  spec.version       = BusRat::VERSION
  spec.authors       = ["Matt Cone"]
  spec.email         = ["matt@macinstruct.com"]
  spec.summary       = %q{A wrapper for the Pittsburgh Port Authority API}
  spec.description   = %q{A wrapper for the Pittsburgh Port Authority API}
  spec.homepage      = "https://github.com/mattcone/bus_rat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  
  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "hashie"
end
