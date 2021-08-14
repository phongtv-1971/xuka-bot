devise_for :admins

scope module: :admins, as: :admins do
  root to: "dashboard#dashboard"
end
