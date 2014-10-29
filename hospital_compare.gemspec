# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hospital_compare/version'

Gem::Specification.new do |spec|
  spec.name          = "hospital_compare"
  spec.version       = HospitalCompare::VERSION
  spec.authors       = ["Daniel Carpenter"]
  spec.email         = ["daniel.carpenter01@gmail.com"]
  spec.summary       = %q{A gem for reading the CMS hospital compare flat files.}
  spec.description   = %q{A gem for reading the CMS hospital compare flat files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
