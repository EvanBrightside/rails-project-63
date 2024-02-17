# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def fixture_load(name)
  File.read "#{File.dirname(__FILE__)}/fixtures/#{name}"
end
