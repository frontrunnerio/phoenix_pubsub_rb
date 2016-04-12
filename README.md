# Phoenix Pubsub for Ruby

PhoenixPubsub allows you to publish messages to Phoenix Channels from Ruby. Subscriptions are not implemented (yet).

## Why?

This might be very interesting for people wanting to enrich their Rails app with Realtime capabilities and to leverage the incredible websocket performance of the Erlang VM.
The awaited Rails 5 release with ActionCable will most likely not feature such an ease of scalability as Elixir/Erlang does.

Also this can help people to transition from Rails to Phoenix.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phoenix_pubsub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phoenix_pubsub

## Usage

E.g.: using with [sample chat app](https://github.com/chrismccord/phoenix_chat_example):

```ruby
p = Phoenix::Pubsub::Redis.new(redis_url: 'redis://localhost:6379', phoenix_class: 'Chat.PubSub')
p.publish 'rooms:lobby', 'new:msg', { user: 'rake', body: 'hello from ruby!' }
```

### Requirements

  - Redis
  - Phoenix app with [Redis PubSub adapter](https://github.com/phoenixframework/phoenix_pubsub_redis)

### Sample Chat App

  - Clone Phoenix [Sample Chat app](https://github.com/chrismccord/phoenix_chat_example)
  - Install and configure the [Redis PubSub adapter](https://github.com/phoenixframework/phoenix_pubsub_redis)
  - Make sure the demo app is running
  - Clone this repo, install all dependencies and run `bundle exec rake`
  - You should see a message coming from Ruby

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/phoenix_pubsub_redis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
