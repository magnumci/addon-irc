# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magnum/addons/irc/version'

Gem::Specification.new do |spec|
  spec.name          = "magnum-addon-irc"
  spec.version       = Magnum::Addons::Irc::VERSION
  spec.authors       = ["Dan Sosedoff"]
  spec.email         = ["dan.sosedoff@gmail.com"]
  spec.description   = %q{IRC notifier addon for Magnum CI}
  spec.summary       = %q{IRC notifier addon for Magnum CI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "hashr", "~> 0"
  spec.add_dependency "irc-notify", "~> 0"

  spec.add_development_dependency "bundler",   "~> 1.3"
  spec.add_development_dependency "rake",      "~> 10.0"
  spec.add_development_dependency "rspec",     "~> 2.13"
  spec.add_development_dependency "simplecov", "~> 0.7"
  spec.add_development_dependency "json",      "~> 1.8"
  spec.add_development_dependency "webmock",   "~> 1.2"
end
