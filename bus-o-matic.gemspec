Gem::Specification.new do |s|

  s.name          = "bus-o-matic"
  s.version       = "0.0.2"
  s.authors       = ["Matt Cone"]
  s.email         = ["matt@macinstruct.com"]
  s.summary       = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.description   = %q{A wrapper for the Pittsburgh Port Authority TrueTime Bus API}
  s.homepage      = "https://github.com/mattcone/bus-o-matic"
  s.license       = "MIT"
  
  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "hashie"
end
