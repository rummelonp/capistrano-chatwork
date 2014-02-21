# coding: utf-8

if defined?(Capistrano::VERSION) && Gem::Version.new(Capistrano::VERSION).release >= Gem::Version.new('3.0.0')
  load File.expand_path('../capistrano-chatwork/tasks/capistrano-chatwork.rake', __FILE__)
else
  require 'capistrano-chatwork/capistrano_integration'
end
