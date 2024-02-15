# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag_name, attributes = {})
      single_tags = %w[area base br col command embed hr img input keygen link meta param source track wbr]
      result = "<#{tag_name}"
      attributes.each { |attr_name, attr_value| result << " #{attr_name}=\"#{attr_value}\"" } if attributes.any?
      result << '>'
      result << yield if block_given?
      result << "</#{tag_name}>" if block_given? || !single_tags.include?(tag_name)
      result
    end
  end
end
