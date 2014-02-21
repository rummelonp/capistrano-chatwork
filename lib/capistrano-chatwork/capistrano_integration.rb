# coding: utf-8

require 'capistrano'
require 'capistrano-chatwork/utility'

module CapistranoChatWork
  class CapistranoIntegration
    def self.load_into(capistrano_config)
      capistrano_config.load do
        extend Utility

        namespace :chatwork do
          task :notify_deploy_started do
            on_rollback { notify(fetch(:chatwork_deploy_failed_message)) }
            notify(fetch(:chatwork_deploy_started_message))
          end

          task :notify_deploy_finished do
            notify(fetch(:chatwork_deploy_finished_message))
          end
        end

        before 'deploy:update_code', 'chatwork:notify_deploy_started'
        after  'deploy',             'chatwork:notify_deploy_finished'
      end
    end
  end
end

if Capistrano::Configuration.instance
  CapistranoChatWork::CapistranoIntegration.load_into(Capistrano::Configuration.instance)
end
