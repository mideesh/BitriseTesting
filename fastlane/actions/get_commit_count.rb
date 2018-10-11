module Fastlane
  module Actions
    class GetCommitCountAction < Action
      def self.run(params)
        sh "git rev-list --count --all"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Get the count of commits in git"
      end

      def self.available_options
        []
      end

      def self.output
        []
      end

      def self.authors
        ["mideesh"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end