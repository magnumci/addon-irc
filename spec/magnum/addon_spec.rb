require "spec_helper"

describe Magnum::Addons::Irc do
  describe "#initialize" do
    it "requires host" do
      expect { described_class.new }.
        to raise_error ArgumentError, "Host required"
    end

    it "requires channel" do
      expect { described_class.new(host: "host.com") }.
        to raise_error ArgumentError, "Channel required"
    end

    it "raises error if port is not a number" do
      expect { described_class.new(host: "host.com", channel: "foo", port: "foo") }.
        to raise_error ArgumentError, "Port is not a number"
    end
  end
end