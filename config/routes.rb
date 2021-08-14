class ActionDispatch::Routing::Mapper
  def draw routes_name
    instance_eval File.read(Rails.root.join("config/routes/#{routes_name}.rb"))
  end
end

Rails.application.routes.draw do
  devise_for :admins
  get "health-check", to: "health_check#index"

  draw :api_v1
  draw :admin
end
