# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')

  class FormPresenter
    def initialize(form, options = {})
      @form = form
      @url = options[:url] || '#'
      @method = options[:method] || 'post'
      @class = options[:class] || ''
    end

    def render_html
      result = "<form action=\"#{@url}\" method=\"#{@method}\""
      result << " class=\"#{@class}\"" unless @class.nil? || @class.empty?
      result << '>'
      result << content unless @form.nil? || @form.empty?
      result << "\n</form>"
    end

    private

    def content
      res = ''
      case @form
      when String
        res += @form.to_s
      when Array
        @form.each { |field| res += "\n  #{field}" }
      when Symbol
        res += "\n  #{@form}"
      end
      res
    end
  end
end
