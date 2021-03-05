# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :attachable, polymorphic: true

  validates :body, presence: true

  def comment_user?(id)
    user.id == id
  end
end
