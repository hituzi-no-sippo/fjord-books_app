# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user,            null: false, foreign_key: true
      t.string     :body,            null: false, default: ''
      t.integer    :attachable_id,   null: false, default: 0
      t.string     :attachable_type, null: false, default: ''

      t.timestamps
    end
    add_index :comments, %i[attachable_type attachable_id]
  end
end
