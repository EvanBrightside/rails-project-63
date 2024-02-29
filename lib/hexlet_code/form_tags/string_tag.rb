# frozen_string_literal: true

require_relative 'base_tag'

module HexletCode
  module FormTags
    class StringTag < BaseTag
      TAG = 'input'
      DEFAULT_ATTRIBUTES = { name:, type: 'text' }.freeze
    end
  end
end
