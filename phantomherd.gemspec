# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phantomherd/version'

Gem::Specification.new do |spec|
  spec.name          = "phantomherd"
  spec.version       = Phantomherd::VERSION
  spec.authors       = ["Nickolas Means"]
  spec.email         = ["nick@heliumsyndicate.com"]
  spec.description   = %q{Simple load testing with EventMachine and PhantomJS/CasperJS}
  spec.summary       = spec.summary
  spec.homepage      = "https://github.com/nmeans/phantomherd"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "trollop"
  spec.add_dependency "em-synchrony"
end
