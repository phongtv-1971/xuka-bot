class CreateBots < ActiveRecord::Migration[6.0]
  def change
    create_table :bots do |t|
      t.references :admin, null: false
      t.string :bot_name
      t.string :token
      t.string :room_id

      t.timestamps
    end

    add_index :bots, :room_id
  end
end
