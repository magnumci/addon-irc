require "irc-notify"
require "hashr"

require "magnum/addons/irc/version"
require "magnum/addons/irc/error"
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

        validate_options

        if @channel[0] != "#"
          @channel.prepend("#")
        end
      end

      def run(build)
        message = Message.new(build)
        deliver(message)
      end

      private

      def deliver(message)
        client.register(@nick)

        message.to_a.each do |line|
          client.notify(@channel, line)
        end

        client.quit
      end

      def client
        @client ||= IrcNotify::Client.build(@host, @port, { ssl: @ssl })
      end

      def validate_options
        if @host.nil?
          raise ArgumentError, "Host required"
        end

        unless @port.kind_of?(Fixnum)
          raise ArgumentError, "Port is not a number"
        end

        if @channel.nil?
          raise ArgumentError, "Channel required"
        end
      end
    end
  end
end