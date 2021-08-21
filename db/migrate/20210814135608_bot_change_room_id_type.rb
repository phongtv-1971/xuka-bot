# frozen_string_literal: true

class BotChangeRoomIdType < ActiveRecord::Migration[6.0]
  def up
    change_column :bots, :room_id, :bigint
  end

  def down
    change_column :bots, :room_id, :string
  end
end
