require "spec_helper"

describe Magnum::Addons::Irc do
  let(:socket) { double(:socket) }

  before do
    IrcNotify::Client.stub(:build) { IrcNotify::Client.new(socket) }
  end

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

  describe "#run" do
    let(:options) { Hash(host: "foo.com", channel: "test") }
    let(:payload) { JSON.load(fixture("build.json")) }
    let(:addon)   { described_class.new(options) }

    it "requires a hash" do
      expect { addon.run(nil) }.
        to raise_error ArgumentError, "Hash required"
    end

    context "when connected" do
      let(:client) { double }

      before do
        client.stub(:register)
        client.stub(:notify)
        client.stub(:quit)

        addon.stub(:client) { client }
      end

      it "registers nickname" do
        expect(client).to receive(:register).with("magnum-ci")
        addon.run(payload)
      end

      it "sends notification" do
        expect(client).to receive(:notify).exactly(6).times
        addon.run(payload)
      end

      it "closes connection" do
        expect(client).to receive(:quit)
        addon.run(payload)
      end
    end
  end
end