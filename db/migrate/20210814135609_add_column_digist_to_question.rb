# frozen_string_literal: true

class AddColumnDigistToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :digist, :string
  end
end
