# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/skip_activerecord_callbacks/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-skip_activerecord_callbacks"
  spec.version       = RSpec::SkipActiveRecordCallbacks::VERSION
  spec.authors       = ["Chuck Callebs"]
  spec.email         = ["chuck@callebs.io"]

  spec.summary       = %q{Easily skip ActiveRecord callbacks in RSpec contexts}
  spec.homepage      = "https://www.github.com/ccallebs/rspec-skip_activerecord_callbacks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
end
