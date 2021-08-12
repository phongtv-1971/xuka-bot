class HealthCheckController < ApplicationController
  def index
    render json: "pong", status: :ok
  end
end
