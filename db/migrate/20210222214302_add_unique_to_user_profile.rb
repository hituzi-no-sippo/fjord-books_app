# frozen_string_literal: true

class AddUniqueToUserProfile < ActiveRecord::Migration[6.1]
  remove_index :user_profiles, :user_id
  add_index :user_profiles, :user_id, unique: true
end
