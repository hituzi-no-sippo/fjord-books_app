# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :icon

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  validate :icon_content_type, if: :was_attached?

  def icon_content_type
    extension = ['image/png', 'image/jpeg', 'image/gif']
    errors.add(:icon, 'の拡張子が間違っています') unless icon.content_type.in?(extension)
  end

  def was_attached?
    icon.attached?
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
