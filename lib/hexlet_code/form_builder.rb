# frozen_string_literal: true

require_relative 'form_tags/string_tag'
require_relative 'form_tags/text_tag'
require_relative 'form_tags/label_tag'
require_relative 'form_tags/submit_tag'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')

  class FormBuilder
    def initialize(data)
      @data = data
      @fields = []

      yield self if block_given?
    end

    def label(name)
      FormTags::LabelTag.new(name:)
    end

    def input(name, **options)
      input_type = options[:as] || :string
      check_errors(name)
      clean_attributes = { name:, value: @data[name] }.merge(options.except(:as))
      class_name = "HexletCode::FormTags::#{input_type.capitalize}Tag"
      tag = Object.const_get(class_name).new(clean_attributes)

      @fields.push(label(name), tag)
      tag
    end

    def submit(value = 'Save')
      tag = FormTags::SubmitTag.new(value:)
      @fields << tag
      tag
    end

    def build
      @fields
    end

    private

    def check_errors(name)
      @data.public_send(name)
    rescue NoMethodError => e
      puts "\n No method error: #{e}"
      raise e
    end
  end
end
