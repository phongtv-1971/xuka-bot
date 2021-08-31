devise_for :admins

scope module: :admins, as: :admins do
  root to: "dashboard#index"

  resources :bots
end
