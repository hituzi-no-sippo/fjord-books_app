# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: 'reports'

  validates :title, presence:	true
  validates :body,  presence:	true

  def author?(user_id)
    author.id == user_id
  end
end
