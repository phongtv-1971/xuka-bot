class Admins::BotsController < Admins::BaseController
  skip_before_action :load_bot, only: [:new, :create]

  def new
    render layout: "admins/dashboard"
  end

  def create
    Bot.create! params_create_bot.merge(admin_id: current_admin.id)

    redirect_to admins_root_path
  rescue ActiveRecord::RecordInvalid => errors
    @resource = errors.record
    render :new, layout: "admins/dashboard"
  end

  def show; end

  private

  def params_create_bot
    params.permit :bot_name, :room_id, :token
  end
end
