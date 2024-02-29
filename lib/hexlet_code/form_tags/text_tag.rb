# frozen_string_literal: true

require_relative 'tag_with_block'

module HexletCode
  module FormTags
    class TextTag < TagWithBlock
      TAG = 'textarea'
      DEFAULT_ATTRIBUTES = { name:, cols: 20, rows: 40 }.freeze
    end
  end
end
