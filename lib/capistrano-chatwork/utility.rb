# coding: utf-8

require 'cha'

module CapistranoChatWork
  module Utility
    def self.extended(base)
      base.instance_eval do
        _cset(:chatwork_api_token) { ENV['CHATWORK_API_TOKEN'] }
        _cset(:chatwork_room_id)   { nil }
        _cset(:chatwork_deploy_started_message)  { "#{user} is deploying #{deployment_name} to #{rails_env}" }
        _cset(:chatwork_deploy_finished_message) { "#{user} finished deploying #{deployment_name} to #{rails_env}" }
        _cset(:chatwork_deploy_failed_message)   { "#{user} failed deployment of #{deployment_name} to #{rails_env}" }
      end
    end

    def notify(message)
      client = Cha::Client.new(api_token: fetch(:chatwork_api_token))
      client.create_room_message(fetch(:chatwork_room_id), message)
    end

    def user
      if (u = `git config user.name`.strip) != ''
        u
      elsif (u = ENV['USER']) != ''
        u
      else
        'Someone'
      end
    end

    def deployment_name
      if fetch(:branch, nil)
        "#{fetch(:application)}/#{fetch(:branch)}"
      else
        fetch(:application)
      end
    end

    def rails_env
      fetch(:rails_env, 'production')
    end
  end
end
