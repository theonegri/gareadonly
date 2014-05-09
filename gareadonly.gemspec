# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GAReadonly/version'

Gem::Specification.new do |spec|
  spec.name          = "gareadonly"
  spec.version       = GAReadonly::VERSION
  spec.authors       = ["theo negri"]
  spec.email         = ["theo.negri@gmail.com"]
  spec.description   = %q{Simple read-only wrapper for the Google Analytics API}
  spec.summary       = %q{Simple read-only wrapper for the Google Analytics API}
  spec.homepage      = "http://github.com/theonegri/gareadonly"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'google-api-client'
  spec.add_dependency('google-api-client')
  spec.add_development_dependency 'oauth2'
  spec.add_dependency('oauth2')
end