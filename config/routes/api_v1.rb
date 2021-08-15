namespace :api, format: :json do
  namespace :v1 do
    post :cw_hook, to: "hooks#chatwork"
  end
end
