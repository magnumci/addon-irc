module Magnum
  module Addons
    class Irc
      class Message
        attr_reader :build

        def initialize(build)
          unless build.kind_of?(Hash)
            raise ArgumentError, "Hash required"
          end

          @build = Hashr.new(build)
        end

        def to_a
          lines = [
            build.title,
            "Commit: #{build.message} (#{build.commit_url})"
          ]

          if build.compare_url
            lines << "Diff: #{build.compare_url}"
          end

          lines << "Branch: #{build.branch}"
          lines << "Author: #{build.author}"
          lines << "Duration: #{build.duration_string}"
          lines << "View build: #{build.build_url}"

          lines
        end

        def to_s
          to_a.join("\n")
        end
      end
    end
  end
end