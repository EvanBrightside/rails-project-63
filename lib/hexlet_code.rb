# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormPresenter, 'hexlet_code/form_presenter.rb')

  def self.form_for(data, options = {}, &block)
    raw_form = FormBuilder.new(data, &block).build
    FormPresenter.new(raw_form, options).render_html
  end
end
