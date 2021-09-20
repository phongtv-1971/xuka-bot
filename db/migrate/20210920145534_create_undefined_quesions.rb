class CreateUndefinedQuesions < ActiveRecord::Migration[6.0]
  def change
    create_table :undefined_quesions do |t|
      t.string :question_content
      t.string :bot_question_id

      t.timestamps
    end
  end
end
