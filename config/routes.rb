Rails.application.routes.draw do
  root to: "rooms#index"
  resources :room
end
