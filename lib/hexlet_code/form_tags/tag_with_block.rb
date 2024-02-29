# frozen_string_literal: true

module HexletCode
  module FormTags
    class TagWithBlock < BaseTag
      def initialize(attributes = {})
        super
        @attributes = {}.merge(self.class::DEFAULT_ATTRIBUTES, attributes.except(:value))
        @block = -> { @value }
      end

      # def build
      #   Tag.build(@tag, @attributes) { @block.call }
      # end
    end
  end
end
