# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'se_providers_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "se_providers_api_client"
  spec.version       = SeProvidersApiClient::VERSION
  spec.authors       = ["Science Exchange Engineering"]
  spec.email         = ["devs@scienceexchange.com"]
  spec.homepage      = "https://www.scienceexchange.com"

  spec.summary       = "A Ruby wrapper for the Science Exchange Providers API."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday"
  spec.add_dependency "mime-types"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
