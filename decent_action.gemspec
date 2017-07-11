# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decent_action/version'

Gem::Specification.new do |spec|
  spec.name          = 'decent_action'
  spec.version       = DecentAction::VERSION
  spec.authors       = ['Nick Chubarov']
  spec.email         = ['nick.chubarov@gmail.com']

  spec.summary       = 'Simple declarative action tool'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'virtus'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'activemodel'
end
