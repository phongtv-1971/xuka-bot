class Chatworks::AnswerService < Chatworks::BaseService
  def execute
    result = Question.search(raw_question, bot.id)
    answer = (result.answers.first&.content if result&.train?)
    answer ||= Settings.hook.messages.default

    bot.send_message reply_message(answer)
  end
end
