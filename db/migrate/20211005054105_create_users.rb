# frozen_string_literal: true

# Create users table
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
