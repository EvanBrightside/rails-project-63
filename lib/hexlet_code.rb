# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormPresenter, 'hexlet_code/form_presenter.rb')

  class Error < StandardError; end

  def self.form_for(data, options = {}, &)
    raw_form = FormBuilder.new(data, &).build
    FormPresenter.new(raw_form, options).render_html
  end
end
