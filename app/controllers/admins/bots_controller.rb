class Admins::BotsController < Admins::BaseController
  skip_before_action :load_bot, only: [:new, :create]

  def show; end

  def create; end
end
