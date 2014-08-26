# Capistrano ChatWork

Capistrano extension for notify to ChatWork

## Usage

Add the library to your `Gemfile`:

```ruby
group :development do
  gem 'capistrano-chatwork', require: false
end
```

And load it into your deployment script `config/deploy.rb`:

```ruby
require 'capistrano-chatwork'
```

Add ChatWork configuration:

```ruby
set :chatwork_api_token, 'YOUR_API_TOKEN'
set :chatwork_room_id, 'YOUR_ROOM_ID'
```

## Configuration

You can modify any of the following Capistrano variables in your `deploy.rb` config.

### Required variables

- `chatwork_api_token` - Set ChatWork API Token. Defaults to `ENV['CHATWORK_API_TOKEN']`.
- `chatwork_room_id`   - Set ChatWork room id for notify message.

### Message variables

- `chatwork_deploy_started_message`  - Set message when deployment is started.
  Defaults to `"#{user} is deploying #{deployment_name} to #{rails_env}"`
- `chatwork_deploy_finished_message` - Set message when deployment is finished.
  Defaults to `"#{user} finished deploying #{deployment_name} to #{rails_env}"`
- `chatwork_deploy_failed_message`   - Set message when deployment is failed.
  Defaults to `"#{user} failed deployment of #{deployment_name} to #{rails_env}"`

#### Skip notification

Skip notification when set to false, nil or blank string to message variables

```ruby
# Skip deploy start notification
set :chatwork_deploy_started_message, false

# Skip deploy finished notification
set :chatwork_deploy_finished_message, nil

# Skip deploy failed notification
set :chatwork_deploy_failed_message, ''
```

#### Available methods in message

- `user`            - Get user name from git config, or environment variables.
- `deployment_name` - Get from `branch` and/or `application` of Capistrano variables.
- `rails_env`       - Get from `rails_env` of Capistrano variables.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 [Kazuya Takeshima](mailto:mail@mitukiii.jp). See [LICENSE][license] for details.

[license]: LICENSE.md
