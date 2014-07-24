# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-chatwork/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-chatwork'
  spec.version       = CapistranoChatWork::VERSION
  spec.authors       = ['Kazuya Takeshima']
  spec.email         = ['mail@mitukiii.jp']
  spec.summary       = %q{Capistrano extension for notify to ChatWork}
  spec.homepage      = 'https://github.com/mitukiii/capistrano-chatwork'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capistrano'
  spec.add_runtime_dependency 'cha'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
