class Cw::AnswerService < Cw::BaseService
  def initialize args
    super
    @undefined_question_service = Cw::UndefinedQuestionService.new(args)
  end

  def execute
    answer = calculation_results || find_in_undefined || query_answers || Settings.hook.messages.default
    bot.send_message(reply(answer), @undefined_question) if answer != Settings.hook.status.created_question_by_undefined
  end

  private

  def query_answers
    data = Question.search(raw_message, fields: [:content], where: {bot_id: bot.id, question_type: "train"})

    if data.total_count.positive?
      question = data.results.first
      question.answers.first&.content
    else
      @undefined_question = @undefined_question_service.create_undefined_question
      nil
    end
  end

  def calculation_results
    return if is_number?(raw_message)

    Dentaku(raw_message)
  end

  def find_in_undefined
    @undefined_question_service.find_in_undefined
  end

  def is_number? string
    true if Float(string)
  rescue StandardError
    false
  end
end
