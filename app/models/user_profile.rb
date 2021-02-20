# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  validates :postal_code, numericality: { greater_than: 0 }
  validates :address, presence: true
  validates :bio, presence: true
end
