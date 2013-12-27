# Capistrano ChatWork

Capistrano extension for notify to ChatWork

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-chatwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-chatwork

## Usage

In `deploy.rb`:

```ruby
require 'capistrano/chatwork'

set :chatwork_api_token, 'your api token'
set :chatwork_room_id, 'your room id'
```

## Contributing

1. Fork it ( https://github.com/mitukiii/capistrano-chatwork/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 [Kazuya Takeshima](mailto:mail@mitukiii.jp). See [LICENSE][license] for details.

[license]: LICENSE.md
