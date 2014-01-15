# IRC Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to an IRC channel

![Build Status](https://magnum-ci.com/status/44b2c1e0d27ed5b5a1d874be9fbcb9a4.png)

## Usage

Example:

```ruby
require "magnum/addons/irc"

# Initialize addon
addon = Magnum::Addon::Irc.new(
  server: "irc.freenode.org", 
  nick: "bot", 
  channel: "test"
)

# Send build payload
addon.run(build_payload)
```

## Configuration

Available options:

- `server`   - Server hostname or IP
- `port`     - Server port (defaults to 6667)
- `channel`  - Channel name

## Testing

Execute test suite:

```
bundle exec rake test
```

## License

The MIT License (MIT)

Copyright (c) 2013-2014 Dan Sosedoff, dan.sosedoff@gmail.com