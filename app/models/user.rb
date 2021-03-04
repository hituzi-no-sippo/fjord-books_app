# frozen_string_literal: true

class User < ApplicationRecord
  has_many :following_relationships, class_name: 'UserFollowing', foreign_key: 'follower_id', inverse_of: 'follower', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :follower_relationships, class_name: 'UserFollowing', foreign_key: 'following_id', inverse_of: 'following', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def following?(id)
    following_relationships.exists?(following_id: id)
  end

  def following_count
    following_relationships.count
  end

  def follower_count
    follower_relationships.count
  end
end
