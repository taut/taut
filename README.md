# Taut

Utility for [Slack](http://slack.com) integrations.

## Usage

Taut is useless without hooks. Take a look at [taut-gifme](https://github.com/philtr/gifme) for an
example.

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

