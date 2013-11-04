require "irc-notify"
require "hashr"

require "magnum/addons/irc/version"
require "magnum/addons/irc/message"

module Magnum
  module Addons
    class Irc
      def initialize(options={})
        @host    = options[:host]
        @port    = options[:port] || 6697
        @ssl     = options[:ssl] || false
        @nick    = options[:nick] || "magnum-ci"
        @channel = options[:channel]

        if @channel[0] != "#"
          @channel.prepend("#")
        end

        @client = IrcNotify::Client.build(@host, @port, { ssl: @ssl })
      end

      def run(build)
        message = Message.new(build)
        deliver(message)
      end

      private

      def deliver(message)
        @client.register(@nick)

        message.to_a.each do |line|
          @client.notify(@channel, line)
        end

        @client.quit
      end
    end
  end
end