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

- `server`   - IRC server hostname or IP
- `port`     - IRC server port
- `channel`  - Channel name
- `nick`     - Sender nickname

## Testing

Execute test suite:

```
bundle exec rake test
```