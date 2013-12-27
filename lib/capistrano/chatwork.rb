require 'capistrano'
require 'json'
require 'net/http'

Capistrano::Configuration.instance(:must_exist).load do
  after 'deploy', 'chatwork:notify'

  namespace :chatwork do
    _cset(:chatwork_api_token, nil)
    _cset(:chatwork_room_id, nil)

    def post_message(message)
      uri = URI("https://api.chatwork.com/v1/rooms/#{chatwork_room_id}/messages")
      req = Net::HTTP::Post.new(uri)
      req['X-ChatWorkToken'] = chatwork_api_token
      req.set_form_data('body' => message)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
      case res
      when Net::HTTPSuccess
      else
        logger.important JSON.parse(res.body)['errors'].first
      end
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
      if branch
        "#{application}/#{branch}"
      else
        application
      end
    end

    def env
      fetch(:rack_env, fetch(:rails_env, 'production'))
    end

    task :notify do
      post_message("#{user} finished deploying #{deployment_name} to #{env}.")
    end
  end
end
