# frozen_string_literal: true

module HexletCode
  module FormTags
    class BaseTag
      attr_reader :tag, :block
      attr_accessor :value, :attributes

      TAG = ''
      DEFAULT_ATTRIBUTES = {}.freeze

      def initialize(attributes = {})
        @tag = self.class::TAG
        @value = attributes[:value]
        @attributes = {}.merge(self.class::DEFAULT_ATTRIBUTES, attributes)
      end

      # def build
      #   Tag.build(@tag, @attributes)
      # end
    end
  end
end
