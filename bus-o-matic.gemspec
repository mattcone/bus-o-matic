Gem::Specification.new do |s|

  s.name          = "bus-o-matic"
  s.version       = "0.0.3"
  s.authors       = ["Matt Cone"]
  s.email         = ["matt@macinstruct.com"]
  s.summary       = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.description   = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.homepage      = "https://github.com/mattcone/bus-o-matic"
  s.license       = "MIT"
  s.platform = Gem::Platform::RUBY
  
  s.require_paths = ['lib']
  s.files = Dir.glob("**/*").reject { |x| File.directory?(x) }
  s.add_dependency "httparty", '~> 0.10.2'
  s.add_dependency "hashie", '~> 2.0'
end
