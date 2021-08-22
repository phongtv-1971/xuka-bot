class Chatworks::AnswerService < Chatworks::BaseService
  def initialize args
    super
    @question = args[:webhook_event][:body]
  end

  def execute
    answer = reply_message GoogleAnswerService.new(question).perform
    bot.send_message answer
  end

  private
  attr_reader :question
end
