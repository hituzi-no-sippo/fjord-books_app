# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :postal_code, presence: true, numericality: true
  validates :address, presence: true
  validates :bio, presence: true
end
