# frozen_string_literal: true

require_relative 'tag_with_block'

module HexletCode
  module FormTags
    class LabelTag < TagWithBlock
      TAG = 'label'

      def initialize(attributes = {})
        super
        name = attributes[:name]
        @attributes = {}.merge(self.class::DEFAULT_ATTRIBUTES, { for: name })
        @block = -> { name.capitalize }
      end
    end
  end
end
