# frozen_string_literal: true

class AddUniqueToUserFollowings < ActiveRecord::Migration[6.1]
  add_index :user_followings, %i[following_id follower_id], unique: true
end
