# frozen_string_literal: true

class UserFollowing < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower,  class_name: 'User'

  validates :following, presence: true, uniqueness: { scope: :follower }
  validates :follower,  presence: true

  validate :another_user

  def another_user
    errors.add(:following, 'はフォロワーと違うユーザにしてください') if following_id == follower_id
  end
end
