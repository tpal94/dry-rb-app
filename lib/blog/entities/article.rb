require "types"

module Blog
  module Entities
    class Article < Dry::Struct
    	 attribute :title, Types::Strict::String
    	 attribute :published_at, Types::Strict::Time.optional
         attribute :status, Types::ArticleStatus

    end
  end
end
