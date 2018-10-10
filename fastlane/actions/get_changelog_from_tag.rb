module Fastlane
  module Actions
    class GetChangelogFromTagAction < Action
      def self.run(params)
        match_tag = params[:match_tag]
        tags_str = sh "git for-each-ref --sort=-taggerdate --format '%(tag)' refs/tags/#{match_tag} --count=2"
        tags_array = tags_str.split;
        if tags_array.size() > 1          
          change_log = sh "git log #{tags_array[1]}..#{tags_array[0]} --no-merges --pretty=format:'* %s'"          
        end
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