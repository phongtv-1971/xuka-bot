class Cw::QuestionService < Cw::BaseService
  def create
    validate_input

    question = bot.questions.create content: raw_question, question_type: :train
    question.answers.create content: raw_answer, is_correct: nil
    notice = build_raw_notice question

    bot.send_message reply(notice)
  end

  private

  def validate_input
    return unless raw_question.blank? || raw_answer.blank?

    bot.send_message reply(Api::Usage.question)
    raise ArgumentError, "Bot::#{bot.id}::#{bot.room_id}: Cw::QuestionService - Input question errors"
  end

  def match_question
    body.match Settings.hook.regex.create_question
  end

  def raw_question
    match_question[:question]&.strip
  end

  def raw_answer
    match_question[:answer]&.strip
  end

  def build_raw_notice question
    <<~Raw
      [info][title]Create question success #ID=#{question.id}[/title]
      QUESTION: #{raw_question}
      ANSWER: #{raw_answer}
      [/info]
    Raw
  end
end
