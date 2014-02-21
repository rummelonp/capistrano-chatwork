# coding: utf-8

require 'capistrano-chatwork/utility'

def _cset(key, value = nil, &block)
  set(key, value || block)
end

extend CapistranoChatWork::Utility

namespace :chatwork do
  task :notify_deploy_started do
    notify(fetch(:chatwork_deploy_started_message))
  end

  task :notify_deploy_finished do
    notify(fetch(:chatwork_deploy_finished_message))
  end

  task :notify_deploy_failed do
    notify(fetch(:chatwork_deploy_failed_message))
  end
end

before 'deploy:starting',  'chatwork:notify_deploy_started'
after  'deploy:finishing', 'chatwork:notify_deploy_finished'
after  'deploy:failed',    'chatwork:notify_deploy_failed'
