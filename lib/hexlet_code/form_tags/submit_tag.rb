# frozen_string_literal: true

require_relative 'tag_with_block'

module HexletCode
  module FormTags
    class SubmitTag < BaseTag
      TAG = 'input'
      DEFAULT_ATTRIBUTES = { type: 'submit', value: @value }.freeze
    end
  end
end
