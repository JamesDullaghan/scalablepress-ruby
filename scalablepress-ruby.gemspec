# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scalablepress/version'

Gem::Specification.new do |spec|
  spec.name          = "scalablepress-ruby"
  spec.version       = Scalablepress::VERSION
  spec.authors       = ["James Dullaghan"]
  spec.email         = ["james@pandodev.com"]

  spec.summary       = %q{Scalablepress Ruby Wrapper}
  spec.description   = %q{Ruby bindings for the Scalablepress API}
  spec.homepage      = "https://github.com/JamesDullaghan/scalablepress-ruby/"
  spec.license       = "MIT"

  spec.add_dependency "rest-client"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
