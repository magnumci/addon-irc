# IRC Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to an IRC channel

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

Copyright (c) 2013 Dan Sosedoff, Magnum CI

MIT License