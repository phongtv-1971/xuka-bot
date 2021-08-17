class Api::V1::HooksController < Api::V1::BaseController
  def chatwork
    # set up token
    ChatWork.api_key = ENV["BOT_ACCOUNT_TOKEN"]

    # get room id and body of the message
    room_id = params[:webhook_event][:room_id]
    body = params[:webhook_event][:body]

    # find room
    c = ChatWork::Room.find room_id: room_id
    room_name = c.name

    # set up some params
    destination_room_id = ENV["DESTINATION_ROOM_ID"]
    reply_id = params[:webhook_event][:from_account_id]
    room_id = params[:webhook_event][:room_id]
    message_id = params[:webhook_event][:message_id]
    answer = GetAnswerService.new(params[:webhook_event][:body]).perform || "Em chưa được dạy ạ (bow)"

    body = <<~RAW
      [rp aid=#{reply_id} to=#{room_id}-#{message_id}]
      #{answer}
    RAW


    # change token to bot's token
    ChatWork.api_key = ENV["BOT_ACCOUNT_TOKEN"]

    # create message from bot
    ChatWork::Message.create room_id: destination_room_id, body: body
    render status: 200
  end
end
