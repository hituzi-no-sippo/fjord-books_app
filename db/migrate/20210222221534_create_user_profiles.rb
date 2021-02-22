# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :postal_code, null: false
      t.string :address, null: false
      t.string :bio, null: false

      t.timestamps
    end
  end
end
