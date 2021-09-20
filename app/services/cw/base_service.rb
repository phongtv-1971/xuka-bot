class Cw::BaseService
  def initialize args
    @room_id = args[:webhook_event][:room_id]
    @message_id = args[:webhook_event][:message_id]
    @reply_id = args[:webhook_event][:from_account_id]
    @body = args[:webhook_event][:body]
    @args = args
  end

  private
  attr_reader :room_id, :message_id, :reply_id, :body, :args

  def reply message
    <<~RAW
      [rp aid=#{reply_id} to=#{room_id}-#{message_id}]
      #{message}
    RAW
  end

  def bot
    @bot ||= Bot.find_by! room_id: room_id
  end

  def raw_message
    match = body.match(Settings.hook.regex.raw_message)
    return "" if match.blank?

    match[:message].strip
  end
end
