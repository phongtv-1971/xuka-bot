class Admins::DashboardController < Admins::BaseController
  skip_before_action :load_bot

  def index
    @bots = current_admin.bots
  end
end
