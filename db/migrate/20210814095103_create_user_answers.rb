class CreateUserAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_answers do |t|
      t.references :score_board, null: false
      t.string :submit_id
      t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
