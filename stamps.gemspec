# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stamps/version"

Gem::Specification.new do |s|
  s.name        = "stamps"
  s.version     = Stamps::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matt Sears"]
  s.email       = ["matt@mattsears.com"]
  s.homepage    = "http://rubygems.org/gems/stamps"
  s.summary     = %q{Ruby wrapper for the Stamps.com Web Services API}
  s.description = %q{Stamps is Stamps.com backed library for creating postage labels, calculate the shipping cost of packages, standardize domestic addresses via USPS CASS certified Address Matching Software, and track shipments.}

  s.rubyforge_project = "stamps"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('simplecov', '~> 0.4.0')
  s.add_development_dependency('shoulda', '~> 2.11.3')
  s.add_development_dependency('mocha', '~> 0.9.11')
  s.add_development_dependency('webmock', '~> 1.6.2')
  s.add_development_dependency('awesome_print')
  s.add_development_dependency('yard')
  s.add_development_dependency('bluecloth')

  s.add_runtime_dependency('httpi', '0.7.9')
  s.add_runtime_dependency('savon', '>= 0.8.6')
  s.add_runtime_dependency('json', '~> 1.5.1')
  s.add_runtime_dependency('multi_json', '~> 1.0')
  s.add_runtime_dependency('hashie', '~> 1.0.0')
end
