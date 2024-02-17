# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')

  class FormBuilder
    def initialize(data)
      @data = data
      @fields = []

      yield self if block_given?
    end

    def input(name, **options)
      @fields << Tag.build('label', for: name) { name.capitalize }
      return textarea(name, remove_as_option(options)) if options[:as] == :text

      default_attributes = { name: name, type: 'text' }
      check_errors(name)
      default_attributes[:value] = @data[name]
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
      @fields
    end

    private

    def check_errors(name)
      @data.public_send(name)
    rescue NoMethodError => e
      puts "\n No method error: #{e}"
      raise e
    end

    def remove_as_option(options)
      options.except(:as)
    end
  end
end
