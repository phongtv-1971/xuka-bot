class Api::V1::HooksController < Api::V1::BaseController
  def chatwork
    Chatworks::AnswerService.new(params).execute
    render status: 200, json: :ok
  end
end
