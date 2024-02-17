# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  def self.form_for(data, options = {}, &block)
    FormBuilder.new(data, options, &block).build
  end
end
