module Fastlane
  module Actions
    class GetVersionFromTagAction < Action
      def self.run(params)
        match_tag = params[:match_tag]
        git_tag = sh "git describe HEAD --match #{match_tag}"
        version_matcher = git_tag.match /[0-9].[0-9]*.[0-9]*/        
        version_matcher.to_s.strip
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Get the version number from git tag"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :match_tag,
                                       env_name: "GIT_MATCH_TAG", # The name of the environment variable
                                       description: "Commit Match Tag", # a short description of this parameter
                                       verify_block: proc do |value|
                                          raise "No Match tag passed for GetVersionFromTagAction given, pass using `match_tag: 'tag'`".red unless (value and not value.empty?)
                                          # raise "Couldn't find file at path '#{value}'".red unless File.exist?(value)
                                       end)
        ]
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