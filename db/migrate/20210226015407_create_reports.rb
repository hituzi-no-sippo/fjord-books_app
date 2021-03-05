# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string    :title, null: false, default: ''
      t.string    :body,  null: false, default: ''

      t.timestamps
    end
  end
end
