# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naked_migrations/version'

Gem::Specification.new do |spec|
  spec.name          = 'naked_migrations'
  spec.version       = NakedMigrations::VERSION
  spec.authors       = ['Robert Scaduto']
  spec.email         = ['rscaduto@developagility.com']
  spec.description   = %q{A wrapper for rosenfeld's active_record_migrations with additional tasks}
  spec.summary       = %q{Includes additional database tasks for generating config files for development and deployment}
  spec.homepage      = 'http://github.com/developagility/naked_migrations'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_dependency 'rake'
  spec.add_dependency 'active_record_migrations', '~> 4.0.1.0'
  spec.add_dependency 'highline', '~> 1.6.19'
  spec.add_dependency 'capistrano', '~> 3.0'
  spec.add_dependency 'capistrano-bundler'
  spec.add_dependency 'capistrano-rails', '~> 1.1.0'
end