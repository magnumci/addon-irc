require "irc-notify"
require "hashr"

require "magnum/addons/irc/version"
require "magnum/addons/irc/message"

module Magnum
  module Addons
    class Irc
      def initialize(options={})
        @server  = options[:server]
        @port    = options[:port] || 6697
        @ssl     = options[:ssl] || false
        @nick    = options[:nick] || "magnum-ci"
        @channel = options[:channel]

        @client = SlackNotify::Client.new(@server, @port, ssl: @ssl)
      end

      def run(build)
        message = Message.new(build)
        deliver(message.to_s)
      end

      private

      def deliver(message)
        @client.register(@nick)
        @client.notify(@channel, message)
        @client.quit
      end
    end
  end
end
