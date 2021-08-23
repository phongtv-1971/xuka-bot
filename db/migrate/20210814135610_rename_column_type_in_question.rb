# frozen_string_literal: true

class RenameColumnTypeInQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :type, :question_type
  end
end
