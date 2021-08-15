class Api::V1::CwsController < Api::V1::BaseController
  def index
    render html: "index page"
  end

  def create
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
    body = "Hello \nMessage in #{room_name}:\n#{body}"

    # change token to bot's token
    ChatWork.api_key = ENV["BOT_ACCOUNT_TOKEN"]

    # create message from bot
    ChatWork::Message.create room_id: destination_room_id, body: body
    render status: 200
  end
end
