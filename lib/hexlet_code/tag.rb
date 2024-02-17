# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[area base br col command embed hr img input keygen link meta param source track wbr].freeze

    def self.build(tag_name, attributes = {})
      result = "<#{tag_name}"
      attributes.each { |attr_name, attr_value| result << " #{attr_name}=\"#{attr_value}\"" } if attributes.any?
      result << '>'
      body_tag(tag_name, yield, result) if block_given?
      result << "</#{tag_name}>" if block_given? || !SINGLE_TAGS.include?(tag_name)
      result
    end

    class << self
      private

      def body_tag(tag_name, body, result)
        case body
        when String
          result << body.to_s
        when Array
          body.each { |field| result << "\n  #{field}" }
        when Symbol
          result_tag = tag_name == 'label' ? body.to_s : "\n  #{body}"
          result << result_tag
        end
        result
      end
    end
  end
end
