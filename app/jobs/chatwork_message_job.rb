class ChatworkMessageJob < ApplicationJob
  queue_as :default

  def perform token, room_id, body, undefined_question
    new_message = ChatWork::Client
                  .new(api_key: token)
                  .create_message room_id: room_id, body: body
    undefined_question.update(bot_question_id: new_message["message_id"]) if undefined_question.present?
  end
end
