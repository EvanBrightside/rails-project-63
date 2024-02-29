# frozen_string_literal: true

module HexletCode
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
      result = ''
      result += "\n"
      result += @form.map do |node|
        tag_params = [node.tag, node.attributes]
        tag_params << node.block unless node.block.nil?
        "  #{Tag.build(*tag_params)}"
      end.join("\n")
      result
    end
  end
end
