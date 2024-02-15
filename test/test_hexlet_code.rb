# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_user
    user = HexletCode.form_for :user
    assert_equal user, '<form action="#" method="post"></form>'
  end

  def test_form_for_url
    user = HexletCode.form_for :user, url: '/users'
    assert_equal user, '<form action="/users" method="post"></form>'
  end
end
