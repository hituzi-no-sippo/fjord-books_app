# frozen_string_literal: true

require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  test '#name_or_email' do
    email = 'alice@example.com'
    user = User.new(email: email)

    assert_equal email, user.name_or_email

    name = 'Alice Pleasance Liddell'
    user.name = name

    assert_equal name, user.name_or_email
  end
end
