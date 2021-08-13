class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :type
      t.references :bot, null: false

      t.timestamps
    end
  end
end
