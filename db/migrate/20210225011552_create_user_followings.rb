# frozen_string_literal: true

class CreateUserFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_followings do |t|
      t.references :following, null: false, foreign_key: { to_table: :users }
      t.references :follower,  null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
