# Taut

Utility for [Slack](http://slack.com) integrations.

## Getting Started

Taut is useless without hooks. Take a look at [taut-gifme](https://github.com/philtr/taut-gifme) for an
example.

Put this in your Gemfile:

```ruby
gem "taut", github: "philtr/taut"
```

### Standalone

Create a `config.ru`:

```ruby
require "bundler"
Bundler.require

run Taut::Application
```

### In a Rails app

This is not supported, but you should be able to mount Taut in your routes:

```ruby
# config/routes.rb
Your::Application.routes.draw do
  mount Taut::Application, at: "/taut"
end
```

## Configuration

Set the following environment variables:

```
SLACK_TOKEN=198uihchu0ah801308
SLACK_DOMAIN=philtr
SLACK_USERNAME=TautBot
SLACK_EMOJI=:ghost:
```

Any environment variable is available inside your hooks:

```
config.slack_domain # => "philtr"
config.slack_token  # => "198uihchu0ah801308"
```




