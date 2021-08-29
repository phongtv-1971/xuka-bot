class Cw::AnswerService < Cw::BaseService
  def execute
    answer = calculation_results || query_answers || Settings.hook.messages.default
    bot.send_message reply(answer)
  end

  private

  def query_answers
    data = Question.search(raw_message, fields: [:content], where: {bot_id: bot.id, question_type: "train"})
    return unless data.total_count.positive?

    question = data.results.first
    question.answers.first&.content
  end

  def calculation_results
    Dentaku(raw_message)
  end
end
