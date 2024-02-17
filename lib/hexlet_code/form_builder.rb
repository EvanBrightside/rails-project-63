# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')

  class FormBuilder
    def initialize(data, options)
      @data = data
      @url = options[:url] || '#'
      @fields = []

      yield self if block_given?
    end

    def input(name, **options)
      return textarea(name, remove_as_option(options)) if options[:as] == :text

      default_attributes = { name: name, type: 'text' }
      default_attributes[:value] = @data[name] if @data[name]
      @fields << Tag.build('input', **default_attributes, **options)
    end

    def textarea(name, options = {})
      default_attributes = { name: name, cols: 20, rows: 40 }
      default_attributes.merge!(options)
      @fields << Tag.build('textarea', **default_attributes) { @data[name] }
    end

    def submit(value = 'Save')
      @fields << Tag.build('input', type: 'submit', value: value)
    end

    def build
      Tag.build('form', action: @url, method: 'post') { @fields }
    end

    private

    def remove_as_option(options)
      options.except(:as)
    end
  end
end
