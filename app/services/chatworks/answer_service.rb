class Chatworks::AnswerService < Chatworks::BaseService
  def execute
    answer = calculation_results || query_answers || Settings.hook.messages.default
    bot.send_message reply_message(answer)
  end

  private

  def query_answers
    result = Question.search(raw_question, bot.id)
    result.answers.first&.content if result&.train?
  end

  def calculation_results
    Dentaku(raw_question)
  end
end
