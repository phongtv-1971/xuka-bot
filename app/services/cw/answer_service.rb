class Cw::AnswerService < Cw::BaseService
  def execute
    answer = calculation_results || query_answers || Settings.hook.messages.default
    bot.send_message reply(answer)
  end

  private

  def query_answers
    result = Question.search(raw_message, bot.id)
    result.answers.first&.content if result&.train?
  end

  def calculation_results
    Dentaku(raw_message)
  end
end
