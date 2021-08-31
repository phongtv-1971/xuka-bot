class Admins::BaseController < ApplicationController
  before_action :authenticate_admin!, :load_bot

  def load_bot
    @current_bot = current_admin.bots.find_by id: params[:id]
  end

  private
  attr_reader :current_bot
end
