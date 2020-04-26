# frozen_string_literal: true

module RailsSiteTemplate
  module Version
    class << self
      def title
        Rails.configuration.default_meta_title
      end

      def version
        File.read('VERSION').strip if File.exist?('VERSION')
      end

      def branch
        branch = `cat .git/HEAD | awk '{ print $2 }'`
        branch.strip.split('/')[2..-1].join('/')
      end

      def sha
        sha = `cat .git/HEAD | awk '{ print $2 }' | xargs -I % sh -c 'cat .git/%'`
        sha.strip
      end

      def git
        {
          branch: branch,
          sha: sha
        }
      end

      def meta
        {
          application: title,
          version: version,
          git: git
        }
      end
    end
  end
end
