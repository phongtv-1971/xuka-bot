class ChatworkMessageJob < ApplicationJob
  queue_as :default

  def perform token, room_id, body
    ChatWork::Client
      .new(api_key: token)
      .create_message room_id: room_id, body: body
  end
end
