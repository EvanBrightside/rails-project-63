# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @user_with_nil_attributes = fixture_load('user_with_nil_attributes.html')
    @user_creation = fixture_load('user_creation.html')
    @user_with_attributes = fixture_load('user_with_attributes.html')
    @user_with_overridden_values = fixture_load('user_with_overridden_values.html')
    @user_creation_with_submit = fixture_load('user_creation_with_submit.html')
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_url
    html = HexletCode.form_for User.new, url: '/users'
    assert_equal html, @user_with_nil_attributes
  end

  def test_form_for_user
    html = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal html, @user_creation
  end

  def test_form_for_user_with_attributes
    html = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal html, @user_with_attributes
  end

  def test_form_for_user_with_overridden_values
    html = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal html, @user_with_overridden_values
  end

  def test_form_for_with_submit
    user = User.new job: 'hexlet'
    html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal html, @user_creation_with_submit
  end

  def test_that_it_return_error
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
