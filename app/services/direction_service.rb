class DirectionService
  def initialize args
    @args = args
  end

  def execute
    case raw_body
    when Settings.hook.regex.create_question
      Cw::QuestionService.new(args).create
    else
      Cw::AnswerService.new(args).execute
    end
  end

  private
  attr_reader :args

  def raw_body
    args[:webhook_event][:body]
  end
end
