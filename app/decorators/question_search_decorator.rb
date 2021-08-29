module QuestionSearchDecorator
  extend ActiveSupport::Concern

  included do
    searchkick
  end

  def search_data
    {
      bot_id: bot_id,
      content: content,
      question_type: question_type
    }
  end
end
