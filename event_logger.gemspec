# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "event_logger"
  spec.version       = EventLogger::VERSION
  spec.authors       = ["Ryan Bennick"]
  spec.email         = ["ryan@320ny.com"]
  spec.description   = %q{Event Logger allows you to log events from anywhere in you Rails appliaction.
	  		Once logged these events can be used to run statistics and gain insight into the event.}
  spec.summary       = %q{Log various events from within a Rails app.}
  spec.homepage      = "https://github.com/320ny/event_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rails', '~> 4.0'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'

end
