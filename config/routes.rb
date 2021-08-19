class ActionDispatch::Routing::Mapper
  def draw routes_name
    instance_eval File.read(Rails.root.join("config/routes/#{routes_name}.rb"))
  end
end

Rails.application.routes.draw do
  if ENV["DISPLAY_TOOL_FOR_DEV"].present?
    require "sidekiq/web"
    Sidekiq::Web.use ActionDispatch::Cookies
    Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
    mount Sidekiq::Web => "/sidekiq"
  end

  get "health-check", to: "health_check#index"

  draw :api_v1
  draw :admin
end
