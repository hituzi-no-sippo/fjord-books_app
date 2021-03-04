# frozen_string_literal: true

class UserFollowing < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower,  class_name: 'User'

  validates :following, presence: true, uniqueness: { scope: :follower }
  validates :follower,  presence: true

  validate :follow_self

  def follow_self
    errors.add(:following, I18n.t('followings.self_follow')) if following_id == follower_id
  end
end
