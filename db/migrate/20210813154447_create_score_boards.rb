class CreateScoreBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :score_boards do |t|
      t.references :question, null: false
      t.string :submit_id
      t.string :order_answers

      t.timestamps
    end
  end
end
