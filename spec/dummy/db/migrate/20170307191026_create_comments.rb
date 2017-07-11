# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :post_id

      t.timestamps
    end
  end
end
