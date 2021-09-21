class AddCwIdToBots < ActiveRecord::Migration[6.0]
  def change
    add_column :bots, :cw_id, :string
  end
end
