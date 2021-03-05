# frozen_string_literal: true

require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  def make_two_user
    [User.create!(email: 'one@example.com', password: '123456'),
     User.create!(email: 'two@example.com', password: '123456')]
  end

  test '#following?' do
    one, two = make_two_user

    assert_not one.following?(two)
    one.follow(two)
    assert one.following?(two)
  end

  test '#followed_by?' do
    one, two = make_two_user

    assert_not two.followed_by?(one)
    one.follow(two)
    assert two.followed_by?(one)
  end

  test '#follow' do
    one, two = make_two_user

    assert_not one.following?(two)
    one.follow(two)
    assert one.following?(two)
  end

  test '#unfollow' do
    one, two = make_two_user

    one.follow(two)

    assert one.following?(two)
    one.unfollow(two)
    assert_not one.following?(two)
  end

  test '#name_or_email' do
    email = 'alice@example.com'
    user = User.new(email: email)

    assert_equal email, user.name_or_email

    name = 'Alice Pleasance Liddell'
    user.name = name

    assert_equal name, user.name_or_email
  end
end
