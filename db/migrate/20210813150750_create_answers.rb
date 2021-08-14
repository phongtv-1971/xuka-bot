class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :is_correct, default: false
      t.references :question, null: false
      t.text :content
      t.text :explain

      t.timestamps
    end
  end
end
