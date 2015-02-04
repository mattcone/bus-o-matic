Gem::Specification.new do |s|

  s.name          = "bus-o-matic"
  s.version       = "0.0.5"
  s.authors       = ["Matt Cone"]
  s.email         = ["matt@macinstruct.com"]
  s.summary       = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.description   = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.homepage      = "https://github.com/mattcone/bus-o-matic"
  s.license       = "MIT"
  s.platform      = Gem::Platform::RUBY
  
  s.require_paths = ['lib']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency "httparty", '~> 0.13.3'
  s.add_dependency "hashie", '~> 3.4'
  
  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rake"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-reporters"
  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
end
