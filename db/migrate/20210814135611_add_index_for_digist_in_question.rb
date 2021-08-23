# frozen_string_literal: true

class AddIndexForDigistInQuestion < ActiveRecord::Migration[6.0]
  def up
    add_index :questions, :digist, unique: true
  end

  def down
    remove_index :questions, :digist
  end
end
