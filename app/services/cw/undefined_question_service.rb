# rubocop:disable Metrics/AbcSize
class Cw::UndefinedQuestionService < Cw::BaseService
  def create_undefined_question
    UndefinedQuesion.create undefined_question_params
  end

  def find_in_undefined
    return if body.exclude?("[rp aid=#{bot.cw_id} to=#{room_id}-")

    destroy_und_ques = []
    UndefinedQuesion.all.each do |und_ques|
      reply_command = "[rp aid=#{bot.cw_id} to=#{room_id}-#{und_ques.bot_question_id}]"
      next if body.exclude?(reply_command)

      question = bot.questions.create content: und_ques.question_content, question_type: :train
      question.answers.create content: body.gsub("#{reply_command}#{bot.bot_name}", "").gsub(reply_command, ""),
                              is_correct: nil
      destroy_und_ques << und_ques
      und_ques.destroy
      notice = build_raw_notice question

      bot.send_message reply(notice)
    end

    return Settings.hook.status.created_question_by_undefined if destroy_und_ques.present?

    nil
  end

  private

  def undefined_question_params
    {
      question_content: body.gsub("[To:#{bot.cw_id}]#{bot.bot_name}", "").gsub(
        "[To:#{bot.cw_id}]", ""
      )
    }
  end

  def build_raw_notice question
    <<~Raw
      [info][title]Create question success #ID=#{question.id}[/title]
      QUESTION: #{question.content}
      ANSWER: #{question.answers.first&.content}
      [/info]
    Raw
  end
end
# rubocop:enable Metrics/AbcSize
